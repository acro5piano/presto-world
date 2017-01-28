var gulp        = require('gulp')
var browserSync = require('browser-sync').create()

// Run Rails server
const spawn = require('child_process').spawn;

gulp.task('serve', function() {
  spawn('rails', ['server', '--bind', '0.0.0.0', '--port', '9292'])
    .stdout.on('data', function(data){
      process.stdout.write(`rails: ${data}`)
    })
})

// Static server
gulp.task('watch', function() {
  browserSync.init({
    proxy: 'http://localhost:9292',
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
