class AuthorItem < SubscriptionItem
  after_create :create_notify_book

  def create_notify_book
    Book.all.each do |book|
      user.notify_books.create(book: book) if book.author.include?(content)
    end
  end
end
