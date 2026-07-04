#!/usr/bin/env bash
#
# Interactively add a talk (or a new venue for an existing talk) to _tabs/talks.md
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TALKS_FILE="${TALKS_FILE:-$SCRIPT_DIR/../_tabs/talks.md}"

[[ -f "$TALKS_FILE" ]] || { echo "Error: talks file not found at $TALKS_FILE" >&2; exit 1; }

I1="    "
I2="        "
I3="            "

# ---------- generic helpers ----------

trim() {
  local s="$1"
  s="${s#"${s%%[![:space:]]*}"}"
  s="${s%"${s##*[![:space:]]}"}"
  printf '%s' "$s"
}

ask() {
  local prompt="$1" ans
  read -rp "$prompt" ans
  trim "$ans"
}

# first line number >= start, in [start,end], containing substring
find_in_range() {
  local start="$1" end="$2" sub="$3"
  awk -v s="$start" -v e="$end" -v needle="$sub" \
    'NR>=s && NR<=e && index($0, needle) > 0 { print NR; exit }' "$TALKS_FILE"
}

# first line number > after, whose content exactly equals `exact`
find_exact_after() {
  local after="$1" exact="$2"
  awk -v after="$after" -v pat="$exact" \
    'NR>after && $0==pat { print NR; exit }' "$TALKS_FILE"
}

total_lines() { wc -l < "$TALKS_FILE" | tr -d ' '; }

strip_tag() {
  # strip a leading `<div class="...">` and trailing `</div>` from a single line
  local line="$1"
  line="$(printf '%s' "$line" | sed -E 's/^[[:space:]]*<div class="[^"]*">//')"
  line="$(printf '%s' "$line" | sed -E 's/<\/div>[[:space:]]*$//')"
  printf '%s' "$line"
}

# ---------- link / block builders ----------

build_slides_block() {
  local slides="$1" poster="$2" add_url="$3" add_label="$4"
  local -a lines=()
  [[ -n "$slides" ]] && lines+=("${I3}<a class=\"talk-link\" href=\"{{ \"${slides}\" | relative_url }}\" target=\"_blank\">[Slides]</a>")
  [[ -n "$poster" ]] && lines+=("${I3}<a class=\"talk-link\" href=\"{{ \"${poster}\" | relative_url }}\" target=\"_blank\">[Poster]</a>")
  [[ -n "$add_url" ]] && lines+=("${I3}<a class=\"talk-link\" href=\"{{ \"${add_url}\" | relative_url }}\" target=\"_blank\">[${add_label}]</a>")
  (( ${#lines[@]} == 0 )) && return 0
  printf '%s\n' "${I2}<div class=\"talk-slides\">"
  printf '%s\n' "${lines[@]}"
  printf '%s\n' "${I2}</div>"
}

build_venue_row() {
  local desc="$1" slides="$2" poster="$3" add_url="$4" add_label="$5"
  printf '%s\n' "${I1}<div class=\"talk-venue-row\">"
  printf '%s\n' "${I2}<div class=\"talk-description\">${desc}</div>"
  build_slides_block "$slides" "$poster" "$add_url" "$add_label"
  printf '%s\n' "${I1}</div>"
}

build_new_talk_item() {
  local title="$1" desc="$2" slides="$3" poster="$4" add_url="$5" add_label="$6"
  printf '%s\n' '<div class="talk-item">'
  printf '%s\n' "${I1}<div class=\"talk-title\">${title}</div>"
  build_venue_row "$desc" "$slides" "$poster" "$add_url" "$add_label"
  printf '%s\n' '</div>'
}

# splice `content` (may be multi-line, passed via a temp file path $1) into
# $TALKS_FILE right before line number $2, then move the result into place.
splice_before_line() {
  local content_file="$1" before_line="$2"
  local tmp; tmp="$(mktemp)"
  local n; n="$(total_lines)"
  if (( before_line > n )); then
    cat "$TALKS_FILE" "$content_file" > "$tmp"
  else
    {
      head -n "$((before_line - 1))" "$TALKS_FILE"
      cat "$content_file"
      tail -n "+${before_line}" "$TALKS_FILE"
    } > "$tmp"
  fi
  mv "$tmp" "$TALKS_FILE"
}

# replace lines [$2,$3] of $TALKS_FILE with the contents of file $1
replace_lines() {
  local content_file="$1" start="$2" end="$3"
  local tmp; tmp="$(mktemp)"
  {
    head -n "$((start - 1))" "$TALKS_FILE"
    cat "$content_file"
    tail -n "+$((end + 1))" "$TALKS_FILE"
  } > "$tmp"
  mv "$tmp" "$TALKS_FILE"
}

# ---------- main flow ----------

YEAR="$(date +%Y)"
echo "Using year: $YEAR"

Y_START="$(find_in_range 1 "$(total_lines)" "<div class=\"year-header\">${YEAR}</div>")"

if [[ -z "$Y_START" ]]; then
  echo "Year $YEAR not found yet -- it will be created."
  YEAR_EXISTS=0
else
  YEAR_EXISTS=1
  Y_END_EXCL="$(awk -v start="$Y_START" \
    'NR>start && index($0,"class=\"year-header\"")>0 { print NR; exit }' "$TALKS_FILE")"
  [[ -z "$Y_END_EXCL" ]] && Y_END_EXCL="$(( $(total_lines) + 1 ))"
fi

# Collect talk-item blocks (start, end, title) within this year's section.
declare -a BLOCK_START=() BLOCK_END=() BLOCK_TITLE=()
if [[ "$YEAR_EXISTS" == "1" ]]; then
  pos=$(( Y_START + 1 ))
  while (( pos < Y_END_EXCL )); do
    open="$(find_in_range "$pos" "$((Y_END_EXCL - 1))" '<div class="talk-item">')"
    [[ -z "$open" ]] && break
    # confirm exact match (no leading whitespace)
    line_content="$(sed -n "${open}p" "$TALKS_FILE")"
    if [[ "$line_content" != '<div class="talk-item">' ]]; then
      pos=$(( open + 1 ))
      continue
    fi
    close="$(find_exact_after "$open" '</div>')"
    [[ -z "$close" ]] && { echo "Error: could not find end of talk-item block starting at line $open" >&2; exit 1; }
    title_line="$(find_in_range "$open" "$close" 'class="talk-title"')"
    title="$(strip_tag "$(sed -n "${title_line}p" "$TALKS_FILE")")"
    BLOCK_START+=("$open"); BLOCK_END+=("$close"); BLOCK_TITLE+=("$title")
    pos=$(( close + 1 ))
  done
fi

MODE=""       # "new_talk" | "add_venue"
SEL_START=""; SEL_END=""; TITLE=""

if [[ "$YEAR_EXISTS" == "1" && "${#BLOCK_TITLE[@]}" -gt 0 ]]; then
  echo "Talks already recorded for $YEAR:"
  for i in "${!BLOCK_TITLE[@]}"; do
    printf '  %d) %s\n' "$((i + 1))" "${BLOCK_TITLE[$i]}"
  done
  choice="$(ask 'Use an existing talk title? Enter its number, or leave blank for a new talk: ')"
  if [[ -n "$choice" ]]; then
    [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 1 && choice <= ${#BLOCK_TITLE[@]} )) || {
      echo "Error: invalid selection." >&2; exit 1
    }
    idx=$((choice - 1))
    MODE="add_venue"
    SEL_START="${BLOCK_START[$idx]}"; SEL_END="${BLOCK_END[$idx]}"
    TITLE="${BLOCK_TITLE[$idx]}"
    echo "Adding a new venue to: $TITLE"
  fi
fi

if [[ -z "$MODE" ]]; then
  MODE="new_talk"
  TITLE="$(ask 'Talk title: ')"
  [[ -n "$TITLE" ]] || { echo "Error: title is required." >&2; exit 1; }
fi

OCCASION="$(ask 'Occasion (e.g. STOC 2026): ')"
LOCATION="$(ask 'Location (e.g. Salt Lake City): ')"
[[ -n "$OCCASION" && -n "$LOCATION" ]] || { echo "Error: occasion and location are required." >&2; exit 1; }
DESC="${OCCASION}, ${LOCATION}"

SLIDES="$(ask 'Slides link (leave blank to skip): ')"
POSTER="$(ask 'Poster link (leave blank to skip): ')"
ADD_URL="$(ask 'Additional link (leave blank to skip): ')"
ADD_LABEL="Link"
if [[ -n "$ADD_URL" ]]; then
  custom_label="$(ask 'Label for the additional link [Link]: ')"
  [[ -n "$custom_label" ]] && ADD_LABEL="$custom_label"
fi

NEW_ROW_FILE="$(mktemp)"
trap 'rm -f "$NEW_ROW_FILE"' EXIT
build_venue_row "$DESC" "$SLIDES" "$POSTER" "$ADD_URL" "$ADD_LABEL" > "$NEW_ROW_FILE"

if [[ "$MODE" == "add_venue" ]]; then
  if sed -n "${SEL_START},${SEL_END}p" "$TALKS_FILE" | grep -q 'class="talk-header"'; then
    # legacy single-venue format -> convert to title + two venue-rows
    title_line="$(find_in_range "$SEL_START" "$SEL_END" 'class="talk-title"')"
    slides_open="$(find_in_range "$SEL_START" "$SEL_END" 'class="talk-slides"' || true)"
    if [[ -n "$slides_open" ]]; then
      slides_close="$(find_exact_after "$slides_open" "${I2}</div>")"
      header_close="$(find_exact_after "$slides_close" "${I1}</div>")"
    else
      header_close="$(find_exact_after "$title_line" "${I1}</div>")"
    fi
    desc_open=$((header_close + 1))
    desc_open_content="$(sed -n "${desc_open}p" "$TALKS_FILE")"
    if [[ "$desc_open_content" == *"</div>"* ]]; then
      desc_close="$desc_open"
    else
      desc_close="$(find_exact_after "$desc_open" "${I1}</div>")"
    fi
    if (( desc_close != SEL_END - 1 )); then
      echo "Error: unexpected structure in existing talk block (lines $SEL_START-$SEL_END)." >&2
      echo "Please add this venue manually." >&2
      exit 1
    fi

    OLD_TITLE_TEXT="$(strip_tag "$(sed -n "${title_line}p" "$TALKS_FILE")")"

    CONVERTED="$(mktemp)"
    {
      printf '%s\n' '<div class="talk-item">'
      printf '%s\n' "${I1}<div class=\"talk-title\">${OLD_TITLE_TEXT}</div>"
      cat "$NEW_ROW_FILE"
      printf '%s\n' "${I1}<div class=\"talk-venue-row\">"
      # re-indent the old description block by 4 extra spaces
      sed -n "${desc_open},${desc_close}p" "$TALKS_FILE" | sed 's/^/    /'
      if [[ -n "$slides_open" ]]; then
        sed -n "${slides_open},${slides_close}p" "$TALKS_FILE"
      fi
      printf '%s\n' "${I1}</div>"
      printf '%s\n' '</div>'
    } > "$CONVERTED"
    replace_lines "$CONVERTED" "$SEL_START" "$SEL_END"
    rm -f "$CONVERTED"
  else
    # already title + venue-row(s) format -> insert right after the title line (topmost)
    title_line="$(find_in_range "$SEL_START" "$SEL_END" 'class="talk-title"')"
    splice_before_line "$NEW_ROW_FILE" "$((title_line + 1))"
  fi
else
  NEW_ITEM_FILE="$(mktemp)"
  build_new_talk_item "$TITLE" "$DESC" "$SLIDES" "$POSTER" "$ADD_URL" "$ADD_LABEL" > "$NEW_ITEM_FILE"

  if [[ "$YEAR_EXISTS" == "1" ]]; then
    CONTENT="$(mktemp)"
    cat "$NEW_ITEM_FILE" > "$CONTENT"
    printf '\n' >> "$CONTENT"
    if [[ "${#BLOCK_START[@]}" -gt 0 ]]; then
      # insert as the topmost talk of this year's section
      insert_at="${BLOCK_START[0]}"
    else
      insert_at="$Y_END_EXCL"
    fi
    splice_before_line "$CONTENT" "$insert_at"
    rm -f "$CONTENT"
  else
    # brand new year section: find correct descending-order position
    n="$(total_lines)"
    insert_at=""
    while IFS=: read -r lineno rest; do
      yr="$(printf '%s' "$rest" | sed -E 's/.*<div class="year-header">([0-9]+)<\/div>.*/\1/')"
      if (( yr < YEAR )); then
        insert_at="$lineno"
        break
      fi
    done < <(grep -n 'class="year-header"' "$TALKS_FILE")

    CONTENT="$(mktemp)"
    if [[ -n "$insert_at" ]]; then
      {
        printf '<div class="year-header">%s</div>\n' "$YEAR"
        printf '\n'
        cat "$NEW_ITEM_FILE"
        printf '\n'
      } > "$CONTENT"
      splice_before_line "$CONTENT" "$insert_at"
    else
      {
        printf '\n'
        printf '<div class="year-header">%s</div>\n' "$YEAR"
        printf '\n'
        cat "$NEW_ITEM_FILE"
      } > "$CONTENT"
      splice_before_line "$CONTENT" "$((n + 1))"
    fi
    rm -f "$CONTENT"
  fi
  rm -f "$NEW_ITEM_FILE"
fi

echo
echo "Done. Review the change with:"
echo "  git -C \"$(cd "$SCRIPT_DIR/.." && pwd)\" diff -- _tabs/talks.md"
