class UsersController < ApplicationController
    def new 
        User = User.new
    end

    def create
      User = User.new(users_params)
      if @user.save
        redirect_to root_path
      else
        render :new
      end
    end

    private
        def users_params
            params.require(:users).permit(:first_name,
                                          :last_name,
                                          :email,
                                          :password,
                                          :password_confirmation)
        end
end
