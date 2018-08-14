class Package < ApplicationRecord
  belongs_to :customer, class_name: "User", foreign_key: "customer_id"
  has_one :delivery

  validates :customer_id, presence: true
  validates :name_on_package, presence: true
  validates :phone_on_package, presence: true
  validates :kuai_di_code, uniqueness: true
  validates :size, presence: true, inclusion: { in: ["Small", "Medium", "Large"]}
  validates :delivery_location_name, presence: true
  validates :delivery_location_lat, presence: true
  validates :delivery_location_lng, presence: true
  validates :delivery_time_start, presence: true
  validates :delivery_time_end, presence: true
  validates :comment, length: { maximum: 50 }
  validates :verification_code, presence: true
end
