class UsersController < ApplicationController
  def new
    @user = FormObject.new
  end

  def create
    unsafe_params = params[:form_object].to_unsafe_hash

    ## Assign random password
    unsafe_params[:password] = User.generate_password

    begin
      validated_params = DryValidate[User.schema, unsafe_params]
    rescue ValidationError => e
      @user = FormObject.from_hash e.params
      render :new and return
    end

    User.validate_and_create validated_params
    ## Send sms. 
    ## validated_params[:password]

    redirect_to programs_path
  end

  def form_object params
    
  end
end