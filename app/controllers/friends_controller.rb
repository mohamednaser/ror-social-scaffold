class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  # Post method
  def create
    @new_friendship_request = Friendship.new

    @new_friendship_request.user_id = current_user.id
    @new_friendship_request.friend_id = params[:friend_id]
    @new_friendship_request.confirmed = false

    if @new_friendship_request.save
      redirect_to users_path, notice: 'Request Sent successfully .'
    else
      error_messages_string = @new_friendship_request.errors.full_messages.join('. ').to_s
      redirect_to user_path(User.find(params[:friend_id])), alert: error_messages_string
    end
  end

  def accept
    invitation_request = Friendship.find(params[:invitation_id])
    invitation_request.confirmed = true

    if invitation_request.save
      redirect_to users_path, notice: 'Invitation Accepted Successfully .'
    else
      redirect_to user_path, alert: 'Error in accept invitation'
    end
  end

  def cancel
    invitation_request = Friendship.find(params[:invitation_id])

    if invitation_request.destroy
      redirect_to users_path, notice: 'Invitation Canceled Successfully .'
    else
      redirect_to user_path, alert: 'Error in cancel invitation'
    end
  end

  def pending
    @pending_friends = current_user.friendships_inverse.pending
    render 'users/pending_friends'
  end
end
