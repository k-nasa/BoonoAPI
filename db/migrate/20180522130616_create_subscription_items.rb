class CreateSubscriptionItems < ActiveRecord::Migration[5.1]
  def change
    create_table :subscription_items do |t|
      t.integer :sub_id, nill: false
      t.string :type
      t.text :content, null: false
      t.integer :user_id, nill: false

      t.timestamps
    end
  end
end
