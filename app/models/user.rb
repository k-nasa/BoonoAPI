class User < ApplicationRecord
  has_secure_token
  has_many :notify_books
  has_many :subscription_items
end
