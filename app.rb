require 'bundler'
Bundler.require()

#========== * CONNECT TO DATABASE
ActiveRecord::Base.establish_connection(
  adapter: :postgresql,
  database: :restaurant
)

#========== * MODELS
require './models/guest.rb'
require './models/item.rb'
require './models/ordr.rb'
require './models/party.rb'
require './models/request.rb'

#========== * HELPER FUNCTIONS

#========== * ROUTES
get '/' do
  erb :index
end

#========== * FOOD API ROUTES

GET '/api/item' do                             #All menu items available
  item = Item.all
  content_type :json
  item.to_json
end

GET '/api/item/:id' do                         #A single menu item and all the parties that included it
  item = Item.find(params[:id].to_i)
  content_type :json
  item.to_json
end

POST '/api/item' do                            #Creates a new food item
  new_item = Item.create(params[:item])
  content_type :json
  new_item.to_json
end

PATCH '/api/item/:id' do                       #Updates a menu item
  content_type :json

end

PUT '/api/item/:id' do                         #Updates a menu item
  content_type :json

end

DELETE '/api/item/:id' do                      #Deletes a menu item
  content_type :json

end


#========== * PARTY API ROUTES

GET '/api/parties' do                           #All parties
  content_type :json


end

GET '/api/parties/:id' do                       #A single party and all the orders it contains
  content_type :json


end

POST '/api/parties' do                          #Creates a new party
  content_type :json

end

PATCH '/api/parties/:id' do                     #Updates a party's details
  content_type :json

end

PUT '/api/parties/:id' do                       #Updates a party's details
  content_type :json

end

DELETE '/api/parties/:id' do                    #Deletes a specific party
  content_type :json


end

#========== * ORDER API ROUTES

POST '/api/orders	' do                          #Cretes a new order
  content_type :json

end

PATCH '/api/orders/:id' do                      #Comp an order
  content_type :json

end

PUT '/api/orders/:id' do                        #Comp an order
  content_type :json

end

DELETE '/api/orders/:id' do                     #delete an order
  content_type :json

end

#========== * BILLING API ROUTES

GET '/api/parties/:id/receipt' do
  content_type :json

end

PATCH '/api/parties/:id/checkout' do
  content_type :json

end

PATCH '/api/parties/:id/checkout' do
  content_type :json

end
