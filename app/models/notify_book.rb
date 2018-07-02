class NotifyBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book, presence: true
  validates :user, presence: true

  scope :today_publish, -> { eager_load(%i(user book)).where('publish_date = ?', Time.zone.today) }
  scope :today_notify_users, -> { today_publish.map(&:user).uniq }
end
