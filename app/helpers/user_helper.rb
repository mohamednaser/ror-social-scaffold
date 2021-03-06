module UserHelper
  include FriendshipHelper

  def pending_requests(requests)
    requests.find_all do |request|
      request.status.nil?
    end
  end
end
