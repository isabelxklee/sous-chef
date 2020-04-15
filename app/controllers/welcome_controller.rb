class WelcomeController < ApplicationController
  def home
    if logged_in?
      redirect_to chef_path(@logged_in_chef)
    end
  end
end
