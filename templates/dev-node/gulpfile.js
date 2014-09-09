/* Config */
var config = require('./package.json').blankConfig.gulp,
  source = config.source,
  build = config.build,
  dist = config.dist,
  concat = config.concat,
  scripts = config.scripts;

var scriptsSource = source
var scriptsBuild = build
var scriptsDist = dist

/* Init */

var i, key, list, copyList = [ source + '/' + scripts + '/**/*.js' ]
for (key in concat) {
  list = concat[key] || [];
  for (i=0; i<list.length; i++) {
    copyList.push('!' + source + '/' + scripts + '/' + list[i]);
  }
}

/* Plugins */
var gulp = require('gulp'),
  concatenate = require('gulp-concat'),
  jshint = require('gulp-jshint'),
  notify = require('gulp-notify'),
  rename = require('gulp-rename'),
  uglify = require('gulp-uglify'),
  del = require('del'),
  runsequence = require('run-sequence');

gulp.task('jshint', function() {
  return gulp.src(source + '/' + scripts + '/**/*.js')
    .pipe(jshint('.jshintrc'))
    .pipe(jshint.reporter('default'));
});

gulp.task('copy', function() {
  return gulp.src(copyList).pipe(gulp.dest(build + '/' + scripts));
});

gulp.task('concatenate', function() {
  var i, key, list, last;
  for (key in concat) {
    list = concat[key] || [];
    if(typeof list == 'string') list = [ list ];
    for(i=0; i<list.length; i++) {
      list[i] = source + '/' + scripts + '/' + list[i];
    }
    last = gulp.src(list)
      .pipe(concatenate(key))
      .pipe(gulp.dest(build + '/' + scripts));
    }
  return last;
});

gulp.task('uglify', function() {
  return gulp.src(dist + '/' + scripts + '/**/*.js')
    .pipe(rename({ suffix: '.min' }))
    .pipe(uglify())
    .pipe(gulp.dest(dist + '/' + scripts));
});

gulp.task('dist', function(cb) {
  runsequence('clean', 'build', 'uglify', cb);
});

gulp.task('clean', function(cb) {
  del([dist + '/' + scripts], cb);
});

gulp.task('build', function(cb) {
   runsequence('copy', 'concatenate', cb);
});

gulp.task('default', function(cb) {
  runsequence('build', cb);
});
