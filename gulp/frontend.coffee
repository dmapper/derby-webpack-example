gulp = require 'gulp'
webpack = require 'webpack'
path = require 'path'
_ = require 'lodash'
WebpackDevServer = require 'webpack-dev-server'
base = require './base'

config = base.config
  target: 'web'
  entry: [
    'webpack-dev-server/client?http://localhost:3000'
    'webpack/hot/dev-server'
    'racer-highway/lib/browser'
    'derby-parsing'
    './app'
  ]
  module:
    loaders: [
      test: /\.css$/
      loader: 'style!css?module&localIdentName=[component]-[local]'
    ,
      test: /\.styl$/
      loader: 'style!css?module&localIdentName=[component]-[local]!stylus'
    ,
      include: /racer-highway\/lib\/browser\.js$/
      loaders: [__dirname + '/../loaders/racer-highway-loader.js']
    ,
      include: /\.json$/
      loader: 'json'
    ]

  output:
    path: __dirname + '/../client'
    pathInfo: true
    publicPath: 'http://localhost:3000/client/'
    filename: 'main.js'
  plugins: [
    new webpack.HotModuleReplacementPlugin(quiet: true)
  ]

gulp.task 'frontend-build', (done) ->
  webpack(config).run base.onBuild(done)

gulp.task 'frontend-watch', ->
  # webpack(config).watch(100, onBuild());
  new WebpackDevServer(webpack(config),
    publicPath: '/client/'
    contentBase: './client/'
    hot: true
    inline: true
    stats: colors: true
    noInfo: true
    headers: {
      'Access-Control-Allow-Origin': 'http://localhost:3001',
      'Access-Control-Allow-Headers': 'X-Requested-With'
    }
  ).listen 3000, 'localhost', (err, result) ->
    if err
      console.log err
    else
      console.log 'webpack dev server listening at localhost:3000'
