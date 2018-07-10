class NotifyBook < ApplicationRecord
  belongs_to :book
  belongs_to :user
  belongs_to :subscription_item

  validates :book, presence: true
  validates :user, presence: true
  validates :subscription_item, presence: true

  scope :today_publish, -> { eager_load(%i(user book)).where('publish_date = ?', Time.zone.today) }
  scope :today_notify_users, -> { today_publish.map(&:user).uniq }
end
