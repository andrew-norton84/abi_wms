class CreateSuppliers < ActiveRecord::Migration[7.1]
  def change
    create_table :suppliers do |t|
      t.string :supplier
      t.references :country, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end

    add_index :suppliers, :supplier, unique: true

  end
end
