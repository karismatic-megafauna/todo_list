class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to lists_url
    else
      redirect_to '/login'
    end  
  end
end
