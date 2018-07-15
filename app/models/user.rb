class User < ApplicationRecord
  has_secure_token
  has_many :notify_books, dependent: :destroy
  has_many :subscription_items, dependent: :destroy

  validates :new_info, presence: true
end
