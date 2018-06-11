
json.friendships do
  json.array! @friendships 
end

json.users do
  json.array! @user do |user|
    json.id user.id
    json.first_name user.first_name
    json.last_name  user.last_name
    json.avatar     user.avatar
    json.email      user.email
  end
end
 


