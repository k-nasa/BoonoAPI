class AddIsUpdateBigImageColumToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :is_update_big_image, :boolean, null: false, default: false
  end
end
