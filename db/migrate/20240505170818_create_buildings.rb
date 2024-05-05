class CreateBuildings < ActiveRecord::Migration[7.1]
  def change
    create_table :buildings do |t|
      t.string :name
      t.text :description
      t.string :building_address

      t.timestamps
    end
  end
end
