class ChangeVerificationCodeToString < ActiveRecord::Migration[5.2]
  def change
    change_column :packages, :verification_code, :string
  end
end
