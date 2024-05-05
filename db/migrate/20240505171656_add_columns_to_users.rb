class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_address, :string
    add_column :users, :is_ambassador, :boolean, default: false
    add_column :users, :want_to_be_ambassador, :boolean, default: false
    add_reference :users, :building, null: false, foreign_key: true
  end
end
