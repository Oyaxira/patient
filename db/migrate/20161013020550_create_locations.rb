class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :code, limit: 10
      t.string :name, limit: 80
      t.integer :patient_id
      t.timestamps
    end
    add_index :locations, :patient_id
  end
end
