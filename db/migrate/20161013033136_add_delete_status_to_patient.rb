class AddDeleteStatusToPatient < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :delete_status, :boolean, default: false
  end
end
