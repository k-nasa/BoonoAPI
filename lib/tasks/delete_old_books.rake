task delete_old_books: :environment do
  books = Book.where("publish_date < ?", Time.zone.now.prev_month)
  books.map(&:destroy)
end
