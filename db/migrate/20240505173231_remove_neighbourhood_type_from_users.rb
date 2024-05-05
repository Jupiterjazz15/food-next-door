class RemoveNeighbourhoodTypeFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :neighbourhood_type, :string
  end
end
