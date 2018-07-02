include BookInsert

task insert_books: :environment do
  save_three_month_books
end
