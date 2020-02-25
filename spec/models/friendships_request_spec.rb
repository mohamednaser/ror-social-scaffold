require 'rails_helper'
RSpec.describe 'Test Friendship Request Model ' do
  before :each do
    @first_user = User.create(name: 'Mohamed Naser', email: 'first@mail.com', password: 'dummypassword123')
    @second_user = User.create(name: 'Ahmed Mohamed', email: 'second@mail.com', password: 'dummypassword456')
    @friendship_request = FriendshipsRequest.new
  end

  describe '#is valid with valid attributes' do
    it 'Create A valid friendship request ' do
      @friendship_request.user_id = @first_user.id
      @friendship_request.friend_id = @second_user.id

      expect(@friendship_request).to be_valid
    end

    it 'invalid friendship request with missed friend id ' do
      @friendship_request = FriendshipsRequest.new
      @friendship_request.user_id = @first_user.id

      expect(@friendship_request).not_to be_valid
    end

    it 'invalid friendship request with missed user id ' do
      @friendship_request = FriendshipsRequest.new
      @friendship_request.friend_id = @second_user.id

      expect(@friendship_request).not_to be_valid
    end
  end
end
