module Sinatra
  module SessionHelper

    def current_user
      if session[:current_user]
        User.find(session[:current_user])
      else
        nil
      end
    end

    def authenticate_api!
      redirect '/' unless current_user
    end

  end
end
