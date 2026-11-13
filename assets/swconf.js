const swconf = {
  cacheName: 'chirpy-hugo-{{ now.UnixNano }}',
  resources: [
    {{ "assets/css/jekyll-theme-chirpy.css" | relURL | jsonify | safeJS }},
    {{ .Home.RelPermalink | jsonify | safeJS }},
    {{ range .RegularPages.ByWeight }}{{ .RelPermalink | jsonify | safeJS }},{{ end }}
    {{ range (readDir "static/assets/js/dist") }}{{ printf "assets/js/dist/%s" .Name | relURL | jsonify | safeJS }},{{ end }}
    {{ "assets/js/modal.js" | relURL | jsonify | safeJS }},
    {{ "assets/js/public-keys.js" | relURL | jsonify | safeJS }},
    {{ "assets/js/publications.js" | relURL | jsonify | safeJS }}
  ],
  interceptor: {paths: [], urlPrefixes: []},
  purge: false
};
