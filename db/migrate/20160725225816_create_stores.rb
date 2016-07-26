class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :store_id
      t.string :name
      t.string :phone_number
      t.string :email
      t.timestamps null: false
    end
  end
end
