class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string  :name
      t.integer :admin_id
      t.string  :auth_token

      t.timestamps
    end
  end
end
