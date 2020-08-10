class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image,                 null: false
      t.string :name,                 null: false
      t.text :text,                   null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :delivery_fee_id,     null: false
      t.integer :prefecture_id,       null: false
      t.integer :days_until_shipping, null: false
      t.integer :price,               null: false
      t.integer :user_id,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
