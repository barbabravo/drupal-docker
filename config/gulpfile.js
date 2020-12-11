var gulp = require('gulp'),
    less = require('gulp-less'),
	path = require('path'),
    connect = require('gulp-connect');


var htmlDest = '/**/*.html',
	lessDest = '/**/*.less';

var prefixList = ['static', 'themes'];
 

gulp.task('html', function(){
	prefixList.forEach(function(prefix){
		gulp.src(prefix + htmlDest)
			.pipe(connect.reload());
	})
})

gulp.task('less', function () {
	prefixList.forEach(function(prefix){
		gulp.src(prefix + lessDest)
			.pipe(less())
			.pipe(gulp.dest(prefix))
			.pipe(connect.reload());
	})
});

gulp.task('connect', function(){
	connect.server({
		port:8888,
		livereload:true
	})
})

gulp.task('watch', function(){
	prefixList.forEach(function(prefix){
		gulp.watch(prefix + htmlDest, ['html']);
		gulp.watch(prefix + lessDest, ['less']);
	})
})

gulp.task('default', ['connect', 'watch']);

gulp.task('build', ['html', 'less']);
