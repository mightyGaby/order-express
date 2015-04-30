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

  get '/' do
    if current_user
      erb :index
    else
      erb :sign_in
    end
  end

  get '/edit' do
    erb :sign_in
  end

  # get '/edit' do
  #   if current_user
  #     erb :edit_menu
  #   else
  #     erb :sign_in      #make sing-in page go to edit index...make link to /edit in menu
  #   end
  # end

end
