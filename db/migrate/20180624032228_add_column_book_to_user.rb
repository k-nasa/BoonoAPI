class AddColumnBookToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :book_id, :integer
  end
end
