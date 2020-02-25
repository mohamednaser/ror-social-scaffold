module UserHelper
  include FriendshipHelper

  def pending_requests(requests)
    requests.find_all{ |request|
      request.status.nil?
    }
  end

end
