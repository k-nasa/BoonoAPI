class Book < ApplicationRecord
  validates :title, presence: true
  validates :publish_date, presence: true
end
