class Book < ApplicationRecord
  has_many :notify_books
  validates :title, presence: true
  validates :publish_date, presence: true
end
