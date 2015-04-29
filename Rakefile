# ***** GEMS *****
require 'bundler/setup'
Bundler.require

# ***** CONNECTION *****
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restaurant'
)

# ***** MODELS *****
require './models/party'
require './models/item'
require './models/order'
require './models/user'



namespace :db do

  desc "Create Admin User"
  task :create_user do
    user = User.new({username: 'blade'})
    user.password='fairtrade1234'
    user.save!
  end

end # namespace :db
