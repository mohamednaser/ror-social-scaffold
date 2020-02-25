module FriendshipHelper
  def friend?(user)
    current_user.friendships.any? do |friend|
      friend.friend_id == user.id
    end
  end

  def friend_request_sent_before?(user)
    current_user.friendships_requests.any? do |friendships_request|
      friendships_request.friend_id == user.id
    end
  end

  def can_sent_invitation?(user)
    return false if user.id == current_user.id
    return false if friend?(user)
    return false if friend_request_sent_before?(user)

    true
  end

  def friend_obj(compare_user , friendship)
    return friendship.inverse_friends if friendship.user_id == compare_user.id

    friendship.user
  end

end
