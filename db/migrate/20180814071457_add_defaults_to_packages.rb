class AddDefaultsToPackages < ActiveRecord::Migration[5.2]
  def change
    change_column :packages, :available, :boolean, default: true, null: false
    change_column :packages, :accepted, :boolean, default: false, null: false
    change_column :packages, :completed, :boolean, default: false, null: false
  end
end
