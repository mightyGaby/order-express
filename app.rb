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
get '/' do
  erb :index
end

#========== * FOOD API ROUTES

GET '/api/foods' do                             #All food items available

end

GET '/api/foods/:id' do                         #A single food item and all the parties that included it
end

POST '/api/foods' do                            #Creates a new food item
end

PATCH '/api/foods/:id' do                       #Updates a food item
end

PUT '/api/foods/:id' do                         #Updates a food item
end

DELETE '/api/foods/:id' do                      #Deletes a food item
end


#========== * PARTY API ROUTES

GET '/api/parties' do                           #All parties

end

GET '/api/parties/:id' do                       #A single party and all the orders it contains

end

POST '/api/parties' do                          #Creates a new party
end

PATCH '/api/parties/:id' do                     #Updates a party's details
end

PUT '/api/parties/:id' do                       #Updates a party's details
end

DELETE '/api/parties/:id' do                    #Deletes a specific party

end

#========== * ORDER API ROUTES

POST '/api/orders	' do                          #Cretes a new order
end

PATCH '/api/orders/:id' do                      #Comp an order
end

PUT '/api/orders/:id' do                        #Comp an order
end

DELETE '/api/orders/:id' do                     #delete an order
end

#========== * BILLING API ROUTES

GET '/api/parties/:id/receipt' do
end

PATCH '/api/parties/:id/checkout' do
end

PATCH '/api/parties/:id/checkout' do
end
