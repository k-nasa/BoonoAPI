class CreateNotifyBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :notify_books do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.references :subscription_item, foreign_key: true

      t.timestamps
    end
  end
end
