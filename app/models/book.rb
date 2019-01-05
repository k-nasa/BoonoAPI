require 'open-uri'

# FIXME 使ってないカラムが幾つかあるが残しておく
# Amazonからのスクレイピングを将来することになったら頑張ってくれ〜
# 並列でぶん回す必要があると思うけど

class Book < ApplicationRecord
  has_many :notify_books, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :publish_date, message: '同じ本です' }
  validates :author, presence: true
  validates :publish_date, presence: true
  validates :detail_url, presence: true

  after_create :create_notify_book

  def create_notify_book
    TitleItem.each do |sub_title|
      sub_title.user.notify_books.create(book: self, subscription_item: sub_title) if title.include?(sub_title.content)
    end

    AuthorItem.each do |sub_author|
      sub_author.user.notify_books.create(book: self, subscription_item: sub_author) if author.include?(sub_author.content)
    end
  end
end
