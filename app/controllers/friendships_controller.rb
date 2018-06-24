class FriendshipsController < ApplicationController
  before_action :set_friendships, only: [:update, :destroy]
  skip_before_action :verify_authenticity_token



  def show
    @user = User.all
    @friendships = Friendship.where(friend_id: current_user).or(Friendship.where(user_id: current_user))
  end  

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id],
                                                 accepted: false)
    respond_to do |format|
      if @friendship.save
        format.html { redirect_to current_user, notice: "Request has been sent" }
        format.js
      else
        format.html { redirect_to users_path }
      end
    end
  end

  def update
    @friendship.update_attributes(accepted: true)
    if @friendship.save
      respond_to do |format|
        format.html { redirect_to current_user }
        format.js
        format.json { render json: current_user}
      end
    else
      redirect_to users_path
    end
  end

  def destroy
    @friendship.destroy
    redirect_to current_user
  end

  private
    def set_friendships
        @friendship = Friendship.where(user_id: params[:id]).or(Friendship.where(friend_id: params[:id])).first
    end
end
