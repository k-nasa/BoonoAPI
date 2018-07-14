require 'open-uri'

class Book < ApplicationRecord
  has_many :notify_books, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :publish_date, message: '同じ本です' }
  validates :author, presence: true
  validates :publish_date, presence: true
  validates :detail_url, presence: true

  before_save :set_book_details
  after_create :create_notify_book

  def set_book_details
    # cssセレクタで無理やり取ってきているだけなので安定していない
    opt = {}
    opt['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'
    doc = Nokogiri::HTML.parse(open(detail_url, opt))

    self.big_image_url = image_url.gsub(/._SL160_/, '')
    self.publisher = doc.css('#dp-container > div:nth-child(27)> table > tr > td > div > ul > li:nth-child(2)').inner_text
    self.amount = doc.css('#buyNewSection > div > div > span > span').inner_text.slice(/\d+/).to_i
    self.synopsis = doc.css('#productDescription > p').inner_text.gsub(/\r\n|\r|\n|\s|\t/, "")
  rescue OpenURI::HTTPError
    sleep(1)
    set_book_details
  end

  def create_notify_book
    TitleItem.all.each do |sub_title|
      sub_title.user.notify_books.create(book: self, subscription_item: sub_title) if title.include?(sub_title.content)
    end

    AuthorItem.all.each do |sub_author|
      sub_author.user.notify_books.create(book: self, subscription_item: sub_author) if author.include?(sub_author.content)
    end
  end
end
