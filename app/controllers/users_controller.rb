class UsersController < ApplicationController
  def new 
      @user = User.new
  end

  def edit 
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

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

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end


  private
    def users_params
      params.require(:user).permit(:first_name,
                                  :last_name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :avatar)
    end
end
