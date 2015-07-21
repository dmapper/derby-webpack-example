DeepMerge = require 'deep-merge'

config =
  module:
    loaders: [
        test: /\.jade$/
        loaders: [__dirname + '/../loaders/derby-jade-loader']
      ,
        include: /\.coffee$/
        loader: "coffee"
        exclude: [
          /\/Topbar\/.+\.coffee$/
          #/node_modules/
        ]
      ,
        include: /\/Topbar\/.+\.coffee$/
        loaders: [__dirname + '/../loaders/derby-component-loader', 'coffee']
    ]
  resolve:
    extensions: ['', '.json', '.js', '.coffee']

unless process.env.NODE_ENV is 'production'
  config.devtool = 'source-map'
  config.debug = true

deepmerge = DeepMerge (target, source, key) ->
  if target instanceof Array
    return [].concat(target, source)
  source

exports.config = (overrides) ->
  deepmerge config, (overrides || {})

exports.onBuild = (done) ->
  (err, stats) ->
    if err
      console.log 'Error', err
    else
      console.log stats.toString()
    done?()
