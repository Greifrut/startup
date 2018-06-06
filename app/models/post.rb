class Post < ApplicationRecord
  after_create :notification

  belongs_to :user
  mount_uploader :photo, PostPhotoUploader

  private

  def all_post
    @posts = Post.all
  end

  def notification
    all_post.each do |post|
      Notification.create(recipient: user, actor: self.user, action: "posted", notifiable: post )
    end
  end
end
