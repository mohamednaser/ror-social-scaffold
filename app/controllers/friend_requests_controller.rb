class FriendRequestsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  # Post method
  def create
    @new_friendship_request = FriendshipsRequest.new

    @new_friendship_request.user_id = current_user.id
    @new_friendship_request.friend_id = params[:friend_id]
    @new_friendship_request.status = FriendshipsRequest::REQUEST_PENDING_STATUS

    if @new_friendship_request.save
      redirect_to users_path, notice: 'Request Sent successfully .'
    else
      error_messages_string = @new_friendship_request.errors.full_messages.join('. ').to_s
      redirect_to user_path(User.find(params[:friend_id])), alert: error_messages_string
    end
  end

  def accept
    invitation_request = FriendshipsRequest.find(params[:invitation_id])
    invitation_request.status = FriendshipsRequest::REQUEST_ACCEPTED_STATUS

    if invitation_request.save
      Friendship.create(user_id: invitation_request.user_id, friend_id: invitation_request.friend_id)
      redirect_to users_path, notice: 'Invitation Accepted Successfully .'
    else
      redirect_to user_path, alert: 'Error in accept invitation'
    end
  end

  def cancel
    invitation_request = FriendshipsRequest.find(params[:invitation_id])
    invitation_request.status = FriendshipsRequest::REQUEST_CANCELED_STATUS

    if invitation_request.save
      redirect_to users_path, notice: 'Invitation Canceled Successfully .'
    else
      redirect_to user_path, alert: 'Error in cancel invitation'
    end
  end

  def reject
    invitation_request = FriendshipsRequest.find(params[:invitation_id])
    invitation_request.status = FriendshipsRequest::REQUEST_REJECTED_STATUS

    if invitation_request.save
      redirect_to users_path, notice: 'Invitation Rejected Successfully .'
    else
      redirect_to user_path, alert: 'Error in reject invitation'
    end
  end
end
