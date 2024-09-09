class RemoveExpiryDateFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :expiry_date, :date
  end
end
