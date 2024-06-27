class AddColumnExpiryDateToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :expiry_date, :date
  end
end
