class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    params = user_params
    puts params[:password] = User.generate_password

    @user = User.new params

    if @user.save
      ## Send sms with pass. 
      redirect_to users_path
    else
      render :new and return
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:phone, :name, :city_id)
  end
end