class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.integer :customer_id
      t.string :name_on_package
      t.string :phone_on_package
      t.string :kuai_di_code
      t.string :size
      t.string :delivery_location_name
      t.float :delivery_location_lat
      t.float :delivery_location_lng
      t.string :delivery_time_start
      t.string :delivery_time_end
      t.boolean :available
      t.boolean :accepted
      t.boolean :completed
      t.integer :verification_code

      t.timestamps
    end
  end
end
