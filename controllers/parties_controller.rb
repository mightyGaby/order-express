class PartiesController < Sinatra::Base

  get '/' do                           #All parties
    parties = Party.all
    content_type :json
    parties.to_json
  end

  get '/:id' do                       #A single party and all the orders it contains
    party = Party.find(params[:id].to_i)
    content_type :json
    party.to_json(include :items)
  end

  post '/' do                          #Creates a new party
    content_type :json
    party = Party.create(params[:party])
    content_type :json
    party.to_json(include :items)
  end

  patch '/:id' do                     #Updates a party's details
    party = Party.find(params[:id].to_i)
    party.update(params[:party])
    content_type :json
    party.to_json(include :items)
  end

  put '/:id' do                       #Updates a party's details
    party = Party.find(params[:id].to_i)
    party.update(params[:party])
    content_type :json
    party.to_json(include :items)
  end

  delete '/:id' do                    #deletes a specific party
    party = Party.find(params[:id].to_i)
    party.delete
    {message: "byeeee"}.to_json
    content_type :json
  end


#========== * BILLING API ROUTES

  get '/:id/receipt' do
    party = Party.find(params[:id])
    content_type :json
  end

  patch '/:id/checkout' do
    content_type :json

  end

  patch '/:id/checkout' do
    content_type :json

  end

end
