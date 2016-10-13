class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :code, limit: 10
      t.string :name, limit: 80, null: false
      t.timestamps
    end
  end
end
