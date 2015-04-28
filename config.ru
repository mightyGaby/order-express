#========== * GEMS

require 'bundler'
Bundler.require()

#========== * CONNECT TO DATABASE

ActiveRecord::Base.establish_connection(
  adapter: :postgresql,
  database: :restaurant
)

#========== * HELPER FUNCTIONS
require './helpers/session_helpers'

#========== * MODELS
require './models/item'
require './models/order'
require './models/party'
require './models/user'

#========== * CONTROLLERS
require './controllers/items_controller'
require './controllers/orders_controller'
require './controllers/parties_controller'
require './controllers/welcome_controller'
require './controllers/sessions_controller'

#========== * CONTROLLERS
map('/api/items') { run ItemsController.new() }
map('/api/orders') { run OrdersController.new() }
map('/api/parties') { run PartiesController.new() }
map('/sessions') { run SessionsController.new() }

map('/') {run WelcomeController.new() }
