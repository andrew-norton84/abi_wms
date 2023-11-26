class CreateWarehouseDivisions < ActiveRecord::Migration[7.1]
  def change
    create_table :warehouse_divisions do |t|
      t.string :division
      t.string :description
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
