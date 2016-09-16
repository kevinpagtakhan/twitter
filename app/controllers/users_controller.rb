class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(signin_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render 'new'
    end
  end

  private

  def signin_params
    params.require(:user).permit(:handle, :full_name, :bio, :password, :password_confirmation)
  end
end
