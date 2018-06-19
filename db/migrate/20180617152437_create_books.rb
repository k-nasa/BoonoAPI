class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author
      t.string :image_url
      t.date :publish_date, null: false

      t.timestamps
    end
  end
end
