module FriendshipHelper
  def friend?(user)
    current_user.friendships.any? do |friend|
      friend.friend_id == user.id
    end
  end

  def friend_request_sent_before?(user)
    current_user.friendships.any? do |friend|
      friend.friend_id == user.id && friend.confirmed == false
    end
  end

  def can_sent_invitation?(user)
    return false if user.id == current_user.id
    return false if current_user.friend?(user)

    true
  end

  def applicable_relation_link(user)
    if friend_request_sent_before?(user)
      invitation = Friendship.find_by(friend_id: user.id, user_id: current_user.id, confirmed: false)
      return link_to 'Cancel Request', invitation_cancel_path(invitation_id: invitation.id),
                     method: :post, class: 'blue-color-link'
    end

    return unless can_sent_invitation?(user)

    link_to 'Invite To Friendship', invitation_send_path(friend_id: user.id), method: :post, class: 'blue-color-link'
  end
end
