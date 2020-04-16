class ChefsController < ApplicationController
  before_action :check_to_see_if_someones_logged_in, only: [:edit, :update, :destroy]
  before_action :set_chef, only: [:show, :edit, :update, :destroy]

  #################### session actions ####################

  def login
    @errors = flash[:errors]
  end

  def handle_login
    @chef = Chef.find_by(email_address: params[:email_address])
    if @chef && @chef.authenticate(params[:password])
      session[:chef_id] = @chef.id
      redirect_to @chef
    else
      flash[:error] = "Invalid username or password"
      redirect_to chef_login_path
    end
  end

  def logout
    session[:chef_id] = nil
    redirect_to controller: 'welcome', action: 'home'
  end

  #################### model actions ####################

  def new
    @chef = Chef.new
    @errors = flash[:errors]
  end

  def create
    @chef = Chef.create(chef_params)
    if @chef.valid?
      session[:chef_id] = @chef.id
      redirect_to @chef
    else
      flash[:errors] = @chef.errors.full_messages
      redirect_to new_chef_path
    end
  end

  def show
    # emoji_translator(entry)
  end

  def edit
  end

  def update
    @chef.update(chef_params)
    redirect_to @chef
  end

  def destroy
    @chef.destroy
    redirect_to controller: 'welcome', action: 'home'
  end

  private
  def set_chef
    @chef = Chef.find(params[:id])
  end

  def chef_params
    params.require(:chef).permit(:first_name, :last_name, :email_address, :password)
  end

  # def emoji_translator(entry)
  #   entry.rating.times do
  #     💖
  #   end
  # end

end