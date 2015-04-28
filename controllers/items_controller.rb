class ItemsController < Sinatra::Base

  enable  :sessions
  helpers Sinatra::SessionHelper

  get '/' do                             #All menu items available
    item = Item.all
    content_type :json
    item.to_json
  end

  get '/:id' do                         #A single menu item and all the parties that included it
    item = Item.find(params[:id].to_i)
    content_type :json
    item.to_json
  end

  post '/' do                            #Creates a new food item
    authenticate_api!
    new_item = Item.create(params[:item])
    content_type :json
    new_item.to_json
  end

  patch '/:id' do                       #Updates a menu item
    authenticate_api!
    item = Item.find(params[:id].to_i)            #find a specific food item
    item.update(params[:item])                    #updates that item with params
    content_type :json
  end

  put '/:id' do                         #Updates a menu item
    authenticate_api!
    item = Item.find(params[:id].to_i)            #find a specific food item
    item.update(params[:item])                    #updates that item with params
    content_type :json
  end

  delete '/:id' do                      #deletes a menu item
    authenticate_api!
    item = Item.find(params[:id].to_i)            #find a specific food item
    item.delete
    {message: "this item is no longer offered on our menu. Way too mainstream"}.to_json
    content_type :json
  end

end
