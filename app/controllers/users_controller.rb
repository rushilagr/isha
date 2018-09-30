class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.password = User.generate_password
    @user.center_id = current_user.center_id unless current_user.admin?

    if !@user.save
      render :new and return
    end

    if !SMS.send_password(@user.name, @user.phone, @user.password)
      @sms_failed = true
      @user.destroy
      render :new and return
    end

    redirect_to users_path, notice: 'User was successfully created.'
  end

  def index
    if current_user.admin?
      @users = User.all
    else
      @users = User.where(center_id: current_user.center_id)
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:phone, :name, :center_id, :role)
  end
end
