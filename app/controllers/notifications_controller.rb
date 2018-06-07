class NotificationsController < ApplicationController
  before_action :set_notification

  def index; end

  private

  def set_notification
    @notifications = Notification.unread
  end

end