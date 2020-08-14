class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code
      t.integer :prefecture_id, null: false
      t.string :city
      t.string :house_number
      t.string :building_name	
      t.integer :phone_number
      t.integer :items_id
      t.timestamps
    end
  end
end
