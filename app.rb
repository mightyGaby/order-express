require 'bundler'
Bundler.require()

#========== * CONNECT TO DATABASE
ActiveRecord::Base.establish_connection(
  adapter: :postgresql,
  database: :restaurant
)

#========== * MODELS

#========== * HELPER FUNCTIONS

#========== * ROUTES

#========== * API ROUTES
