class FriendshipsController < ApplicationController
  before_action :set_friendships, only: [:show, :update, :destroy]

  def index; end  

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id],
                                                 accepted: false)
    if @friendship.save
      redirect_to current_user
    else
      redirect_to users_path
    end
  end

  def update
    @friendship.update_attributes(accepted: true)
    if @friendship.save
      redirect_to current_user
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
