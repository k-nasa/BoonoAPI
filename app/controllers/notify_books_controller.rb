class NotifyBooksController < ApplicationController
  def index
    user = User.find_by(token: params[:token])
    notify_books = user.notify_books.eager_load(:book)
    notify_books = notify_books.order('publish_date')
    books = []
    notify_books.each { |notify_book| books << notify_book.book }

    render json: books, status: :ok
  end
end
