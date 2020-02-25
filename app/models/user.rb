class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships_requests
  has_many :inverse_friendships_requests, class_name: 'FriendshipsRequest', foreign_key: 'friend_id'

  has_many :friendships
  has_many :friendships_inverse, class_name: 'Friendship', foreign_key: 'friend_id'

  def friends
    friendships + friendships_inverse
  end

  def friend?(user)
    friends.include? user
  end
end
