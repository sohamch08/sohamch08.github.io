const swconf = {
  cacheName: 'chirpy-hugo-{{ now.UnixNano }}',
  resources: [
    {{ (partial "theme-css.html" .).RelPermalink | jsonify | safeJS }},
    {{ range (readDir "assets/css") }}{{ partial "asset.html" (printf "assets/css/%s" .Name) | jsonify | safeJS }},{{ end }}
    {{ range (readDir "static/assets/fonts") }}{{ printf "assets/fonts/%s" .Name | relURL | jsonify | safeJS }},{{ end }}
    {{ range (readDir "static/assets/css") }}{{ partial "asset.html" (printf "assets/css/%s" .Name) | jsonify | safeJS }},{{ end }}
    {{ "assets/img/profile.jpg" | relURL | jsonify | safeJS }},
    {{ "assets/img/unicons/news.svg" | relURL | jsonify | safeJS }},
    {{ .Home.RelPermalink | jsonify | safeJS }},
    {{ range .RegularPages.ByWeight }}{{ .RelPermalink | jsonify | safeJS }},{{ end }}
    {{ range (readDir "static/assets/js/dist") }}{{ partial "asset.html" (printf "assets/js/dist/%s" .Name) | jsonify | safeJS }},{{ end }}
    {{ partial "asset.html" "assets/js/modal.js" | jsonify | safeJS }},
    {{ partial "asset.html" "assets/js/public-keys.js" | jsonify | safeJS }},
    {{ partial "asset.html" "assets/js/publications.js" | jsonify | safeJS }}
  ],
  interceptor: {paths: [], urlPrefixes: []},
  purge: false
};
