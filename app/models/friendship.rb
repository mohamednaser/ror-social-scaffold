class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :inverse_friends, class_name: 'User', foreign_key: :friend_id

  scope :pending, -> { where(confirmed: false) }
  scope :confirmed, -> { where(confirmed: true) }
end
