class ApplicationController < ActionController::Base
    helper_method :logged_in_chef, :logged_in?
    # makes controller methods available in the erb view files
    # use the helper_methods in your show to limit what the user can see

  def logged_in_chef
    if session[:chef_id]
      @logged_in_chef = Chef.find_by(id: session[:chef_id])
    end
  end

  def logged_in?
    !!logged_in_chef
  end

  def check_to_see_if_someones_logged_in
    redirect_to chef_login_path unless logged_in?
  end

  def convert_time(datetime)
    @date = datetime.strftime("%B %d, %Y")
    @time = datetime.strftime("%I:%M %p")
  end
end