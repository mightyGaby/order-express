class PartiesController < Sinatra::Base

  # enable  :sessions
  # helpers Sinatra::SessionHelper

  post '/' do                          #Cretes a new order
    new_order = Order.create(params[:order])
    content_type :json
  end

  patch '/:id' do                      #Comp an order
    order = Order.find(params[:id])
    order.update(params[:order])
    content_type :json
  end

  put '/:id' do                        #Comp an order
    order = Order.find(params[:id])
    order.update(params[:order])
    content_type :json
  end

  delete '/:id' do                     #delete an order
    content_type :json
    order = Order.find(params[:id].to_i)
    order.delete
  end


end
