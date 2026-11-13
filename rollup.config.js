import babel from '@rollup/plugin-babel';
import terser from '@rollup/plugin-terser';
import { nodeResolve } from '@rollup/plugin-node-resolve';

const source = 'assets/js-source';
const isProd = process.env.BUILD === 'production';
const banner = `/*!
 * jekyll-theme-chirpy v7.4.1 | © 2019 Cotes Chung | MIT Licensed | https://github.com/cotes2020/jekyll-theme-chirpy/
 */`;

function build(filename, { pwa = false, outputName = null } = {}) {
  return {
    input: `${source}/${pwa ? 'pwa/' : ''}${filename}.js`,
    output: {
      file: pwa ? `static/${filename}.min.js` : `static/assets/js/dist/${filename}.min.js`,
      format: 'iife',
      ...(outputName !== null && { name: outputName }),
      banner,
      sourcemap: !isProd
    },
    plugins: [
      babel({
        babelHelpers: 'bundled',
        presets: ['@babel/env'],
        plugins: [
          '@babel/plugin-transform-class-properties',
          '@babel/plugin-transform-private-methods'
        ]
      }),
      nodeResolve(),
      isProd && terser()
    ]
  };
}

export default [
  ...['commons', 'home', 'categories', 'page', 'post', 'misc'].map((name) => build(name)),
  build('theme', { outputName: 'Theme' }),
  build('app', { pwa: true }),
  build('sw', { pwa: true })
];
