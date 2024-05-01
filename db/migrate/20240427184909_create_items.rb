class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :quantity_unit
      t.decimal :quantity_value
      t.datetime :available_start_date
      t.datetime :available_end_date
      t.datetime :best_before_date
      t.string :item_address
      t.string :food_condition
      t.string :home_condition
      t.boolean :is_available

      t.timestamps
    end
  end
end
