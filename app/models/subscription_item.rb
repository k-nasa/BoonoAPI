class SubscriptionItem < ApplicationRecord
  belongs_to :user
  has_many :notify_books, dependent: :destroy

  validates :user, presence: true
  validates :type, presence: true
  validates :content, presence: true
  validates :content, length: { maximum: 50 }
end
