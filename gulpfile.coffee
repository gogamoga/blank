### Plugins ###
gulp = require 'gulp'
jshint = require 'gulp-jshint'
rename = require 'gulp-rename'
uglify = require 'gulp-uglify'
mocha = require 'gulp-mocha'
coffee = require 'gulp-coffee'
jade = require 'gulp-jade'
stylus = require 'gulp-stylus'
util = require 'gulp-util'
coffeelint = require 'gulp-coffeelint'
del = require 'del'
runSequence = require 'run-sequence'

ngClassify = require 'gulp-ng-classify'
ngAnnotate = require 'gulp-ng-annotate'
mainBowerFiles = require 'main-bower-files'

### Config ###
config = require('./package.json')['gulp-config'] or {}
source = config.source or './source'
build = config.build or './build'
dist = config.dist or './dist'
test = config.test or './test'

### Clean ###

gulp.task 'clean-build', (cb) ->
  del [build], cb

gulp.task 'clean-dist', (cb) ->
  del [dist], cb

gulp.task 'clean', (cb) ->
  runSequence ['clean-build', 'clean-dist'], cb

### Copy ###
gulp.task 'copy-build-source', ->
  gulp
    .src [
      "#{source}/**/*"
      "!#{source}/**/*.coffee"
      "!#{source}/test/**/*"
      "!#{source}/test"
      "!#{source}/**/*.jade"
      "!#{source}/**/*.styl" ]
    .pipe gulp.dest build

gulp.task 'copy-build-test', ->
  gulp
    .src [
      "#{source}/test/**/*"
      "!#{source}/test/**/*.coffee"
      "!#{source}/test/**/*.jade"
      "!#{source}/test/**/*.styl" ]
    .pipe gulp.dest "#{build}/test"

gulp.task 'copy-build', (cb) ->
  runSequence [ 'copy-build-source', 'copy-build-test' ], cb

gulp.task 'copy-dist-source', ->
  gulp
    .src [
      "#{build}/**/*"
      "!#{build}/**/*.js"
      "!#{build}/test/**/*"
      "!#{build}/test"
      "!#{build}/**/*.css"
      "!#{build}/**/*.html"
      "!#{build}/**/*.xml"
      "!#{build}/**/*.xsl" ]
    .pipe gulp.dest dist

gulp.task 'copy-dist-test', ->
  gulp
    .src [
      "#{build}/test/**/*"
      "!#{build}/test/**/*.js"
      "!#{build}/test/**/*.css"
      "!#{build}/test/**/*.html"
      "!#{build}/test/**/*.xml"
      "!#{build}/test/**/*.xsl" ]
    .pipe gulp.dest test

gulp.task 'copy-dist', (cb) ->
  runSequence [ 'copy-dist-source', 'copy-dist-test' ], cb

### Concatenate ###
gulp.task 'concat-example', ->
  gulp
    .src []
    .pipe concatenate ''
    .pipe gulp.dest ''

gulp.task 'concat-build', (cb) ->
  # runSequence cb
  cb()

gulp.task 'concat-dist', (cb) ->
  # runSequence cb
  cb()

### Coffee Lint ###
gulp.task 'lint-source', ->

gulp.task 'lint-test', ->

gulp.task 'lint-coffee', (cb) ->
  runSequence [ 'lint-test', 'lint-coffee' ], cb

### JSHint ###

gulp.task 'jshint-source', ->
  gulp
    .src [ "#{build}/**/*.js", "!#{build}/test/**/*", "!#{build}/test" ]
    .pipe jshint '.jshintrc'
    .pipe jshint.reporter 'default'

gulp.task 'jshint-test', ->
  gulp.src [ "#{build}/test/**/*.js" ]
    .pipe jshint '.jshintrc'
    .pipe jshint.reporter 'default'

gulp.task 'jshint', (cb) ->
  runSequence ['jshint-source', 'jshint-test'], cb

### Angular Build ###

gulp.task 'build-ng', (cb) ->
  runSequence [
    'build-ng-controllers', 'build-ng-directives'
    'build-ng-factories', 'build-ng-services'
    'build-ng-modules' ], cb

gulp.task 'build-ng-controllers', ->
  gulp
    .src ["#{source}/scripts/controller/**/*.coffee"]
    .pipe ngClassify()
    .pipe coffee(bare:false).on 'error', util.log
    .pipe gulp.dest build

gulp.task 'build-ng-services', ->
  gulp
    .src ["#{source}/scripts/controller/**/*.coffee"]
    .pipe ngClassify()
    .pipe coffee(bare:false).on 'error', util.log
    .pipe gulp.dest build

gulp.task 'build-ng-factories', ->
  gulp
    .src ["#{source}/scripts/controller/**/*.coffee"]
    .pipe ngClassify()
    .pipe coffee(bare:false).on 'error', util.log
    .pipe gulp.dest build

gulp.task 'build-ng-modules', ->
  gulp
    .src ["#{source}/scripts/controller/**/*.coffee"]
    .pipe ngClassify()
    .pipe coffee(bare:false).on 'error', util.log
    .pipe gulp.dest build

gulp.task 'build-ng-directives', ->
  gulp
    .src ["#{source}/scripts/controller/**/*.coffee"]
    .pipe ngClassify()
    .pipe coffee(bare:false).on 'error', util.log
    .pipe gulp.dest build

### Build ###

gulp.task 'build-coffee', ->
  gulp
    .src [
      "#{source}/**/*.coffee"
      "!#{source}/test/**/*"
      "!#{source}/test"
      "!#{source}/scripts/controller"
      "!#{source}/scripts/directive"
      "!#{source}/scripts/service"
      "!#{source}/scripts/factory"
      "!#{source}/scripts/module" ]
    .pipe coffee(bare:false).on 'error', util.log
    .pipe gulp.dest build

gulp.task 'build-test-coffee', ->
  gulp
    .src [
      "#{source}/test/**/*.coffee"
      "!{source}/test/app/scripts/**/*" ]
    .pipe coffee(bare:true).on 'error', util.log
    .pipe gulp.dest "#{build}/test"

gulp.task 'build', (cb) ->
  runSequence [ 'build-coffee', 'build-test-coffee', 'copy-build' ], 'concat-build', cb

### Build Jade ###

gulp.task 'build-jade', (cb) ->
  runSequence [ 'build-jade-html', 'build-jade-xml', 'build-jade-xsl'], cb

gulp.task 'build-jade-html', ->
  gulp
    .src [
      "#{source}/**/*.jade"
      "!#{source}/**/*.xml.jade"
      "!#{source}/**/*.xsl.jade"
      "!#{source}/test/**/*"
      "!#{source}/test" ]
    .pipe jade()
    .pipe gulp.dest build

gulp.task 'build-jade-xml', ->
  gulp
    .src [
      "#{source}/**/*.xml.jade"
      "!#{source}/test/**/*"
      "!#{source}/test" ]
    .pipe jade()
    .pipe rename extname: ""
    .pipe gulp.dest build

gulp.task 'build-jade-xsl', ->
  gulp
    .src [
      "#{source}/**/*.xsl.jade"
      "!#{source}/test/**/*"
      "!#{source}/test" ]
    .pipe jade()
    .pipe rename extname: ""
    .pipe gulp.dest build

### Build Stylus ###
gulp.task 'build-stylus', ->
  gulp
    .src [
      "#{source}/**/*.styl"
      "!#{source}/test/**/*"
      "!#{source}/test" ]
    .pipe stylus()
    .pipe gulp.dest build

### Dist ###
gulp.task 'dist-build', ->
  gulp
    .src [ "#{build}/**/*.js", "!#{build}/test/**/*", "!#{build}/test" ]
    .pipe rename suffix: '.min'
    .pipe uglify()
    .pipe gulp.dest dist

gulp.task 'dist-test', ->
  gulp
    .src [ "#{build}/test/**/*.js" ]
    .pipe rename suffix: '.min'
    .pipe uglify()
    .pipe gulp.dest test

gulp.task 'dist', (cb) ->
  runSequence [ 'dist-build', 'dist-test', 'copy-dist' ], 'concat-dist', cb

### Test ###
gulp.task 'mocha', ->
  gulp
    .src [ "#{test}/**/*.js" ], read: false
    .pipe mocha reporter: 'spec', globals: should: require 'should'

gulp.task 'test', (cb) ->
  runSequence 'mocha', cb

### Default ###
gulp.task 'default', (cb) ->
  runSequence 'build', 'dist', cb
