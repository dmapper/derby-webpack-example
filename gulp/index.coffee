gulp = require 'gulp'
nodemon = require 'nodemon'
path = require 'path'

require './frontend'
require './backend'

gulp.task 'build', ['frontend-build', 'backend-build']
gulp.task 'watch', ['frontend-watch', 'backend-watch']

# gulp.task 'run', ['backend-watch']

gulp.task 'run', ['frontend-watch', 'backend-watch'], ->
  nodemon(
    execMap:
      js: 'node'
    script: __dirname + '/../build/backend'
    ignore: ['*']
    watch: ['foo/']
    ext: 'noop'
  ).on 'restart', ->
    #console.log 'Patched!'
