class CreateStockTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :stock_types do |t|
      t.string :stock_type
      t.string :short_desc
      t.string :description

      t.timestamps
    end
  end
end
