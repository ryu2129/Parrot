class NotificationsController < ApplicationController
  def index
    @notifications = current_member.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
