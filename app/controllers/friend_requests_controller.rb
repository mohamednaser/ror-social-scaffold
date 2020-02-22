class FriendRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
  
  end
  # Post method
  def create
    @new_friendship_request = FriendshipsRequest.new
    
    @new_friendship_request.user_id = current_user.id 
    @new_friendship_request.friend_id = params[:friend_id]
    @new_friendship_request.status = 0 

    if @new_friendship_request.save
      redirect_to users_path, notice: 'Request Sent successfully .'
    else
      redirect_to user_path(User.find(params[:friend_id])), alert: @new_friendship_request.errors.full_messages.join('. ').to_s
    end
   end

end
