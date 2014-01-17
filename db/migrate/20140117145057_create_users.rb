class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :first_name
      t.string  :last_name
      t.string  :type
      t.integer :organization_id
      t.string  :password_digest

      t.timestamps
    end
  end
end
