class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.integer :price,             null: false
      t.text :detail,               null: false
      t.integer :condition_id,      null: false
      t.integer :shipping_fee_id,   null: false
      t.integer :shipment_place_id, null: false
      t.integer :shipment_date_id,  null: false
      t.integer :category_id,       null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
