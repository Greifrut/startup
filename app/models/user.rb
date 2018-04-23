class User < ApplicationRecord
    acts_as_authentic
    #Post < User
  has_many :post
    #Frindship relavation
  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy

  has_many :active_friends, ->{ where(friendships: {accepted: true})}, through: :friendships, source: :friend
  has_many :received_friends, ->{ where(friendships: {accepted: true})}, through: :inverse_friendships, source: :user

  has_many :pending_friends, ->{ where(friendships: {accepted: false})}, through: :friendships, source: :friend
  has_many :requested_friendships, ->{ where(friendships: {accepted: false})}, through: :inverse_friendships, source: :user


    #методы
  def requested(user)
    user.in?(requested_friendships)
  end

  def friends(user)
    user.in?(active_friends) | user.in?(received_friends)
  end

  def pending(user)
    user.in?(pending_friends)
  end
end
