require 'rails_helper'
RSpec.describe 'Test Friendship Model ' do
  before :each do
    @first_user = User.create(name: 'Mohamed Naser', email: 'first@mail.com', password: 'dummypassword123')
    @second_user = User.create(name: 'Ahmed Mohamed', email: 'second@mail.com', password: 'dummypassword456')
    @friendship_obj = Friendship.new
  end

  describe '#is valid with valid attributes' do
    it 'Create A valid friendship ' do
      @friendship_obj.user_id = @first_user.id
      @friendship_obj.friend_id = @second_user.id

      expect(@friendship_obj).to be_valid
    end

    it 'invalid friendship with missed friend id ' do
      @friendship_obj.user_id = @first_user.id

      expect(@friendship_obj).not_to be_valid
    end

    it 'invalid friendship request with missed user id ' do
      @friendship_obj.friend_id = @second_user.id

      expect(@friendship_obj).not_to be_valid
    end
  end
end
