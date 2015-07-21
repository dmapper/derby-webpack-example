derby = require 'derby'
global.app = app = module.exports = derby.createApp 'main', __filename

app.loadViews require './index.jade'
app.component require './components/Topbar'
require('./index.css')

app.get '/', (page, model, params) ->
  model.set '_page.template', 'Topbar'
  model.set '_page.foo', 'First'
  page.render()

app.get '/ping', (page, model) ->
  model.set '_page.template', 'Topbar'
  model.set '_page.hello', 'Hello ping page!'
  model.set '_page.foo', 'Second'
  page.render()

app.get '/pong', (page, model) ->
  model.set '_page.template', 'Topbar'
  model.set '_page.hello', 'Hello PONG page!'
  model.set '_page.foo', 'Third'
  page.render()
