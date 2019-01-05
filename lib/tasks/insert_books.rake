task insert_books: :environment do
  BookInsert.save_three_month_books
end
