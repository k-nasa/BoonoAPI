class TitleItem < SubscriptionItem
  after_create :create_notify_book

  def create_notify_book
    Book.all.each do |book|
      user.notify_books.create(book: book, subscription_item: self) if book.title.include?(content)
    end
  end
end
