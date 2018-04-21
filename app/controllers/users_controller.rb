class UsersController < ApplicationController
  def new 
      @user = User.new
  end

  def show; end

  def index
    @user = User.all
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to current_user
    else
      render :new
    end
  end

  private
    def users_params
      params.require(:user).permit(:first_name,
                                  :last_name,
                                  :email,
                                  :password,
                                  :password_confirmation)
    end
end
