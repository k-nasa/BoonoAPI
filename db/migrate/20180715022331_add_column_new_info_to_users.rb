class AddColumnNewInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :new_info, :boolean, default: false, null: false
  end
end
