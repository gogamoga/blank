DEVELOPMENT-NODE-COFFEESCRIPT
===

Generic nodejs project in coffeescript

Usage
---
* work in `source` directory
* build into `build` directory
* write tests in `source/test` directory (mocha)
* release into `dist` directory
* `gulp` - `build`, `build-test`, `dist`, `dist-test` tasks
* `gulp clean`
* `gulp test` - run mocha
* edit [`gulpfile.coffee`](./gulpfile.coffee)
* gulp config in [`package.json`](./package.json)

Gulp plugins
---
* [`gulp-concat`](https://github.com/wearefractal/gulp-concat)
* [`gulp-jshint`](https://github.com/spenceralger/gulp-jshint)
* [`gulp-mocha`](https://github.com/sindresorhus/gulp-mocha)
* [`gulp-rename`](https://github.com/hparra/gulp-rename)
* [`gulp-uglify`](https://github.com/terinjokes/gulp-uglify)
* [`gulp-coffee`](https://github.com/wearefractal/gulp-coffee)
* [`gulp-coffeelint`](https://github.com/janraasch/gulp-coffeelint)
* [`gulp-js-prettify`](https://github.com/mackers/gulp-js-prettify)
* [`gulp-util`](https://github.com/gulpjs/gulp-util)

License
---
#### [MIT](LICENSE)
