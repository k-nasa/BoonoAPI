class CreateSubscriptionItems < ActiveRecord::Migration[5.1]
  def change
    create_table :subscription_items do |t|
      t.string :type
      t.text :content, null: false

      t.timestamps
    end
  end
end
