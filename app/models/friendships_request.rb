class FriendshipsRequest < ApplicationRecord
  # constatnts
  REQUEST_PENDING_STATUS = 1
  REQUEST_ACCEPTED_STATUS = 2
  REQUEST_CANCELED_STATUS = 3 # Canceled by owner
  REQUEST_REJECTED_STATUS = 4 # Rejected by frriend

  # Relations
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  # Scopes
  scope :pending_requests, -> { where(status: REQUEST_PENDING_STATUS) }
  scope :accepted_requests, -> { where(status: REQUEST_ACCEPTED_STATUS) }
end
