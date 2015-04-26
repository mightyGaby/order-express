require 'bundler'
Bundler.require()

#========== * CONNECT TO DATABASE
ActiveRecord::Base.establish_connection(
  adapter: :postgresql,
  database: :restaurant
)

#========== * MODELS
require './models/item.rb'
require './models/guest.rb'
require './models/order.rb'
require './models/party.rb'
require './models/request.rb'

#========== * HELPER FUNCTIONS

#========== * ROUTES
get '/' do
  # erb :index
end

#========== * FOOD API ROUTES

get '/api/items' do                             #All menu items available

  item = Item.all
  content_type :json
  item.to_json
end

get '/api/items/:id' do                         #A single menu item and all the parties that included it

  item = Item.find(params[:id].to_i)
  content_type :json
  item.to_json
end

post '/api/items' do                            #Creates a new food item

  new_item = Item.create(params[:item])
  content_type :json
  new_item.to_json
end

patch '/api/items/:id' do                       #Updates a menu item

  item = Item.find(params[:id].to_i)            #find a specific food item
  item.update(params[:item])                    #updates that item with params
  content_type :json
end

put '/api/items/:id' do                         #Updates a menu item
  item = Item.find(params[:id].to_i)            #find a specific food item
  item.update(params[:item])                    #updates that item with params
  content_type :json
end

delete '/api/items/:id' do                      #deletes a menu item
  item = Item.find(params[:id].to_i)            #find a specific food item
  item.delete
  {message: "this item is no longer offered on our menu. Way too mainstream"}.to_json
  content_type :json
end


#========== * PARTY API ROUTES

get '/api/parties' do                           #All parties
  parties = Party.all
  content_type :json
  parties.to_json
end

get '/api/parties/:id' do                       #A single party and all the orders it contains
  party = Party.find(params[:id].to_i)
  content_type :json
  party.to_json
end

post '/api/parties' do                          #Creates a new party
  content_type :json
  Party.create(params[:party]).to_json
end
#
# patch '/api/parties/:id' do                     #Updates a party's details
#   content_type :json
#
# end
#
# put '/api/parties/:id' do                       #Updates a party's details
#   content_type :json
#
# end
#
# delete '/api/parties/:id' do                    #deletes a specific party
#   content_type :json
#
#
# end
#
# #========== * ORDER API ROUTES
#
# post '/api/orders	' do                          #Cretes a new order
#   content_type :json
#
# end
#
# patch '/api/orders/:id' do                      #Comp an order
#   content_type :json
#
# end
#
# put '/api/orders/:id' do                        #Comp an order
#   content_type :json
#
# end
#
# delete '/api/orders/:id' do                     #delete an order
#   content_type :json
#
# end
#
# #========== * BILLING API ROUTES
#
# get '/api/parties/:id/receipt' do
#   content_type :json
#
# end
#
# patch '/api/parties/:id/checkout' do
#   content_type :json
#
# end
#
# patch '/api/parties/:id/checkout' do
#   content_type :json
#
# end
