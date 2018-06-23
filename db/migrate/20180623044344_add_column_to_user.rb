class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :device_token, :text
  end
end
