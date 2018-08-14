class Delivery < ApplicationRecord
  belongs_to :package
  has_one :customer, through: :package
  belongs_to :worker, class_name: "User", foreign_key: "worker_id"

  validates :package_id, presence: true, uniqueness: true
  validates :worker_id, presence: true, uniqueness: {scope: :customer_id}
end
