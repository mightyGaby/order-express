class PartiesController < Sinatra::Base

  enable  :sessions


  get '/' do                           #All parties
    parties = Party.all
    content_type :json
    parties.to_json
  end

  get '/:id' do                       #A single party and all the orders it contains
    party = Party.find(params[:id].to_i)
    content_type :json
    party.to_json(include: :items)
  end

  post '/' do                          #Creates a new party
    content_type :json
    party = Party.create(params[:party])
    content_type :json
    party.to_json(include: :items)
  end

  patch '/:id' do                     #Updates a party's details
    party = Party.find(params[:id].to_i)
    party.update(params[:party])
    content_type :json
    party.to_json(include: :items)
  end

  put '/:id' do                       #Updates a party's details
    party = Party.find(params[:id].to_i)
    party.update(params[:party])
    content_type :json
    party.to_json(include: :items)
  end

  delete '/:id' do                    #deletes a specific party
    party = Party.find(params[:id].to_i)
    party.delete
    {message: "byeeee"}.to_json
    content_type :json
  end


#========== * BILLING API ROUTES

  get '/:id/receipt' do
    #find a specific party
    #locate the foods
    #add each food to the total
    content_type :json
    items = Party.find(params[:id]).items
    total = 0
    items.map do |item|
      total += item.price
    end
    total.to_json

    # items.compact.map{|item| item.price}.reduce(0, :+)
  end



end
