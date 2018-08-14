class User < ApplicationRecord
  has_many :packages
  has_many :deliveries

  validates :open_id, presence: true, uniqueness: true
  validates :student_number, presence: true, uniqueness: true, format: { with: /^201[45678]1[45]1\d{6}$/i, message: "Please enter correct Student Number"} on: :update
  validates :name, presence: true, uniqueness: true, on: :update
  validates :phone_number, presence: true, uniqueness: true, on: :update
  validates :address_name, presence: true, on: :update
  validates :address_lat, presence: true, on: :update
  validates :address_lng, presence: true, on: :update
end

