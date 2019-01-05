class User < ApplicationRecord
  has_secure_token
  has_many :notify_books, dependent: :destroy
  has_many :subscription_items, dependent: :destroy

  # TODO iosに対応できたらonにする
  # validates :device_token, presence: true
end
