class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :worker_id
      t.integer :package_id

      t.timestamps
    end
  end
end
