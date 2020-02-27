class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships
  has_many :friendships_inverse, class_name: 'Friendship', foreign_key: 'friend_id'

  def friends
    friends = []

    unless friendships_inverse.confirmed.empty?
      friendships_inverse.confirmed.each do |friend|
        friends.push(friend.user)
      end
    end

    unless friendships.confirmed.empty?
      friendships.confirmed.each do |friend|
        friends.push(friend.inverse_friends)
      end
    end

    friends
  end

  def friend?(user)
    friends.include? user
  end
end
