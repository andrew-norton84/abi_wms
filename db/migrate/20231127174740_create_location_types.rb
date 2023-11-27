class CreateLocationTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :location_types do |t|
      t.string :location_type
      t.string :short_desc
      t.string :description

      t.timestamps
    end
  end
end
