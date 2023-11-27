class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :product
      t.references :country, null: false, foreign_key: true
      t.references :product_type, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
