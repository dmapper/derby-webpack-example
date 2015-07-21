derbyServer = require 'local-derby-server'
express = require 'express'
#serveStatic = require 'serve-static'

process.env.BUNDLE_MODE = 'use'

derbyServer.init().run

  app: require('../app')
  #login: require './login'

, (ee, options) ->

  ee.on 'routes', (expressApp) ->
    #expressApp.use serveStatic __dirname + '/../bower_components/'
    # Server router
    #expressApp.use require './routes'
