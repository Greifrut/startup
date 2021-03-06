json.array! @notifications do |notification|
  json.id notification.id
  #json.recipient notification.recipient
  json.actor     notification.actor.first_name
  json.action    notification.action
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.path post_path(notification.notifiable)
end