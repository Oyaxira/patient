class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :first_name, limit: 30
      t.string :middle_name, limit: 10
      t.string :last_name, limit: 30
      t.datetime :birth
      t.integer :gender
      t.integer :status
      t.integer :location_id
      t.integer :viewed_count
      t.timestamps
    end
    add_index :patients, :location_id
  end
end
