class User < ApplicationRecord
  has_secure_token
  has_many :notify_books, dependent: :destroy
  has_many :subscription_items, dependent: :destroy

  before_validation :set_new_info

  def set_new_info
    self.new_info = false
  end
end
