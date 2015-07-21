helper = require './helper'

module.exports = class Topbar
  view: require './index.jade'
  style: require './index.styl'
  init: ->
    console.log 'Hello from component!'
    console.log helper
