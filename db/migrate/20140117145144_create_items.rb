class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string     :name
      t.string     :description
      t.belongs_to :restaurant
      t.integer    :order_id

      t.timestamps
    end
  end
end
