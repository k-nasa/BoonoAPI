class Book < ApplicationRecord
  has_many :notify_books
  validates :title, presence: true
  validates :publish_date, presence: true

  after_create :create_notify_book

  def create_notify_book
    TitleItem.all.each do |sub_title|
      sub_title.user.notify_books.create(book: self) if title.include?(sub_title.content)
    end

    AuthorItem.all.each do |sub_author|
      sub_author.user.notify_books.create(book: self) if author.include?(sub_author.content)
    end
  end
end
