class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :open_id
      t.string :student_number
      t.string :name
      t.string :phone_number
      t.string :address_name
      t.float :address_lat
      t.float :address_lng
      t.string :static_pay_qr
      t.string :photo

      t.timestamps
    end
  end
end
