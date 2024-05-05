class AddDefaultValueToIsAvailableOnItems < ActiveRecord::Migration[7.1]
  def change
    change_column_default :items, :is_available, from: nil, to: false
  end
end
