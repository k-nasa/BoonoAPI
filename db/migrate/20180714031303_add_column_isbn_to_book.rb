class AddColumnIsbnToBook < ActiveRecord::Migration[5.1]
  def change
      add_column :books, :detail_url, :text
      add_column :books, :publisher, :string, limit: 50
      add_column :books, :big_image_url, :text
      add_column :books, :synopsis, :text
      add_column :books, :amount, :integer
  end
end
