class SubscriptionItem < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :type, presence: true
  validates :content, presence: true
  validates :content, length: { maximum: 50 }
end
