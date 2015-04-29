class WelcomeController < Sinatra::Base

  enable  :sessions
  helpers Sinatra::SessionHelper

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  get '/pry' do
    binding.pry
  end

  get '/' do
    erb :index
  end

  # get '/admin' do
  #   if current_user
  #     erb :index
  #   else
  #     erb :admin_not_authenticated
  #   end
  # end

end
