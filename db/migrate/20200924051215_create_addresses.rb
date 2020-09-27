class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_code,  default: "",  null: false
      t.integer     :state,                      null: false
      t.string      :city,         default: "",  null: false
      t.string      :address,      default: "",  null:  false
      t.string      :building_name
      t.string      :phone_number,    null: false
      t.references  :order,           null: false, foreign_key: true
      t.timestamps
    end
  end
end