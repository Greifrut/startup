FactoryBot.define do
  factory :notification do
    recipient_id 1
    actor_id 1
    read_at "2018-06-06 20:51:46"
    action "MyString"
    notifiable_id 1
    notifiable_type "MyString"
  end
end
