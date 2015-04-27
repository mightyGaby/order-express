#========== * GEMS

require 'bundler'
Bundler.require()

#========== * CONNECT TO DATABASE

ActiveRecord::Base.establish_connection(
  adapter: :postgresql,
  database: :restaurant
)

#========== * HELPER FUNCTIONS
##session helpers

#========== * MODELS
require './models/items.rb'
require './models/orders.rb'
require './models/parties.rb'

#========== * CONTROLLERS
require './controllers/items_controller.rb'
require './controllers/orders_controller.rb'
require './controllers/parties_controller.rb'


#========== * CONTROLLERS
map('/api/items') { run ItemsController.new() }
map('/api/orders') { run OrdersController.new() }
map('/api/parties') { run PartiesController.new() }
