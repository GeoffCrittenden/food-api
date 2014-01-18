class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string  :name
      t.string  :address
      t.string  :phone
      t.string  :org_type
      t.integer :admin_id

      t.timestamps
    end
  end
end
