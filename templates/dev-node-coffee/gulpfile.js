/* Plugins */
var gulp = require('gulp'),
  jshint = require('gulp-jshint'),
  rename = require('gulp-rename'),
  uglify = require('gulp-uglify'),
  mocha = require('gulp-mocha'),
  del = require('del'),
  runsequence = require('run-sequence');

/* Config */
var config = require('./package.json')['gulp-config'] || {},
  source = config.source || './source'
  build = config.build || './build'
  dist = config.dist || './dist'
  test = config.test || './test'

/* Clean */

gulp.task('clean-build', function(cb) {
  del([build], cb);
});

gulp.task('clean-dist', function(cb) {
  del([dist], cb);
});

gulp.task('clean', function(cb) {
  runsequence(['clean-build', 'clean-dist'], cb);
});

/* Copy */
gulp.task('copy-build', function() {
  return gulp.src([ source + '/**/*', '!' + source + '/**/*.js' ])
    .pipe(gulp.dest(build));
});

gulp.task('copy-dist', function() {
  return gulp.src([ build + '/**/*', '!' + build + '/**/*.js' ])
    .pipe(gulp.dest(dist));
});

/* Concatenate */
gulp.task('concat-example', function() {
  return gulp.src([])
    .pipe(concatenate(''))
    .pipe(gulp.dest(''));
});

gulp.task('concat-build', function(cb) {
  /* runsequence(cb); */
	cb();
});

gulp.task('concat-dist', function(cb) {
  /* runsequence(cb); */
	cb();
});

/* JSHint */

gulp.task('jshint-source', function() {
  return gulp.src(source + '/**/*.js')
    .pipe(jshint('.jshintrc'))
    .pipe(jshint.reporter('default'));
});

gulp.task('jshint-test', function() {
  return gulp.src(test + '/**/*.js')
    .pipe(jshint('.jshintrc'))
    .pipe(jshint.reporter('default'));
});

gulp.task('jshint', function(cb) {
  runsequence(['jshint-source', 'jshint-test'], cb);
});

/* Build */
gulp.task('build-source', function() {
  return gulp.src(source + '/**/*.js')
    .pipe(gulp.dest(build));
});

gulp.task('build', function(cb) {
  runsequence(['build-source', 'copy-build'], 'concat-build', cb);
});

/* Dist */
gulp.task('dist-build', function() {
  return gulp.src(build + '/**/*.js')
    .pipe(rename({ suffix: '.min' }))
    .pipe(uglify())
    .pipe(gulp.dest(dist));
});

gulp.task('dist', function(cb) {
  runsequence(['dist-build', 'copy-dist'], 'concat-dist', cb);
});

/* Test */
gulp.task('mocha', function() {
  return gulp.src([test + '/**/*.js'], { read: false })
    .pipe(mocha({ reporter: 'spec', globals: { should: require('should') } }));
});

gulp.task('test', function(cb) {
  runsequence('mocha', cb);
});

/* Default */

gulp.task('default', function(cb) {
  runsequence('build', 'dist', cb);
});
