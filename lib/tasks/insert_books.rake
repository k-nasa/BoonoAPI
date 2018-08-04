task insert_books: :environment do
  BookInsert.save_three_month_books
end

task update_books: :environment do
  Book.all.each(&:update_big_image_url)
end
