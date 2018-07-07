class NotifyBooksController < ApplicationController
  def index
    user = User.find_by(token: params[:token])
    notify_books = user.notify_books.eager_load(:book)
    notify_books = notify_books.order('publish_date', 'title')
    json = []
    notify_books.each do |notify_book|
      json << ({ notify_book: notify_book, book: notify_book.book })
    end

    render json: json, status: :ok
  end

  def destroy
    notify_book = NotifyBook.find(params[:id])
    notify_book.destroy!

    render json: 'success!', status: :ok
  rescue => e
    render json: e, status: :internal_server_error
  end
end
