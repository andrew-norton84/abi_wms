class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :customer
      t.references :country, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end

    add_index :customers, :customer, unique: true

  end
end
