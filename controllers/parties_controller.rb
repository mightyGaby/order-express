
  get '/' do                           #All parties
    parties = Party.all
    content_type :json
    parties.to_json
  end

  get '/:id' do                       #A single party and all the orders it contains
    party = Party.find(params[:id].to_i)
    content_type :json
    party.to_json
  end

  post '/' do                          #Creates a new party
    content_type :json
    Party.create(params[:party]).to_json
  end

  patch '/:id' do                     #Updates a party's details
    party = Party.find(param[:id].to_i)
    party.update(param[:party])
    content_type :json
  end

  put '/:id' do                       #Updates a party's details
    party = Party.find(param[:id].to_i)
    party.update(param[:party])
    content_type :json
  end

  delete '/:id' do                    #deletes a specific party
    party = Party.find(params[:id].to_i)
    party.delete
    {message: "byeeee"}.to_json
    content_type :json
  end

end
