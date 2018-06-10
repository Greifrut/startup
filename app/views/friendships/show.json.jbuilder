json.array! @friendships do |friendship|
  json.id friendship.id
  json.sender friendship.user_id
  json.recipient friendship.friend_id
  json.accepted friendship.accepted
end