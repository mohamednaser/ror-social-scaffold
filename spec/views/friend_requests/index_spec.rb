require 'rails_helper'

RSpec.describe 'Test Friendship Model ' do
  before do
    @first_user = User.create(name: 'Mohamed Naser', email: 'first@mail.com', password: 'dummypassword123')
    @second_user = User.create(name: 'Ahmed Mohamed', email: 'second@mail.com', password: 'dummypassword456')

    @friendship_request = FriendshipsRequest.new
    @friendship_request.user_id = @first_user.id
    @friendship_request.friend_id = @second_user.id
    @friendship_request.save

    visit login_path

    render
  end
end
