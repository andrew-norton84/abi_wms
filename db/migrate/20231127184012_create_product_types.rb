class CreateProductTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :product_types do |t|
      t.string :product_type
      t.string :short_desc
      t.string :description

      t.timestamps
    end
  end
end
