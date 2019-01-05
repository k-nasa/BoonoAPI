class NotifyBook < ApplicationRecord
  belongs_to :book
  belongs_to :user
  belongs_to :subscription_item

  validates :book, presence: true
  validates :user, presence: true
  validates :subscription_item, presence: true

  after_create :user_info_update

  scope :today_publish, -> { eager_load(%i(user book)).where('publish_date = ?', Time.zone.today) }
  scope :today_notify_users, -> { today_publish.map(&:user).uniq }

  def user_info_update
    return if user.new_info

    user.update!(new_info: true)
  end
end
