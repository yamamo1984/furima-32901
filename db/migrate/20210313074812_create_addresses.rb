class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :post_code,           null: false
      t.integer     :shipment_place_id,   null: false
      t.string      :city
      t.string      :street_num,          null: false
      t.string      :building
      t.string      :tel_num,             null: false
      t.references  :order,               null: false , foreign_key: true
      

      t.timestamps
    end
  end
end
