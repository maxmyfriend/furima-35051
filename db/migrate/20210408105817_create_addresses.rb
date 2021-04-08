class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :record,        null: false, foreign_key: true
      t.string     :post_cord,     null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :house_number,  null: false
      t.string     :building_name, null: false
      t.string     :phone_number,  null: false
      t.timestamps
    end
  end
end
