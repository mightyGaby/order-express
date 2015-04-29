class OrdersController < Sinatra::Base

  enable  :sessions

  def order_params
    return params[:order] if params[:order]
    body_data = {}
    @request_body ||= request.body.read.to_s
    body_data = (JSON(@request_body)) unless @request_body.empty?
    body_data = body_data['order'] || body_data
  end

  post '/' do                          #Cretes a new order
    new_order = Order.create(order_params)
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
