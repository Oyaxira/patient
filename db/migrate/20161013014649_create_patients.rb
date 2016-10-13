class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :first_name, limit: 30, null: false
      t.string :middle_name, limit: 10
      t.string :last_name, limit: 30, null: false
      t.datetime :birth
      t.integer :gender
      t.integer :status, null: false
      t.integer :location_id, null: false
      t.integer :viewed_count, default: 0
      t.timestamps
    end
    add_index :patients, :location_id
  end
end
