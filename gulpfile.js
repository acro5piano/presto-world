var gulp        = require('gulp')
var browserSync = require('browser-sync').create()

// Static server
gulp.task('watch', function() {
  browserSync.init({
    proxy: 'http://web:3000',
    port: 4000,
    open: false,
    notify: {
      styles: {
        top: 'auto',
        bottom: '0'
      }
    }
  })
  gulp.watch("./app/**/*").on('change', browserSync.reload)
})

gulp.task('default', ['watch'])
