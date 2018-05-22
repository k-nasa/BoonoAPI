class SubscriptionItem < ApplicationRecord
  belongs_to :user
  validates :type, presence: true
  validates :context, presence: true
  validates :context, length: { maximum: 50 }
end
