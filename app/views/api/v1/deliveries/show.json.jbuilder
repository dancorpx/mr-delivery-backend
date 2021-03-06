json.extract! @delivery, :id, :package_id, :worker_id
  json.package @delivery.package, :id, :customer_id, :name_on_package, :phone_on_package, :kuai_di_code, :size, :price, :delivery_location_name, :delivery_location_lat,:delivery_location_lng, :delivery_time_start, :delivery_time_end, :comment, :available,:accepted, :completed, :verification_code, :created_at, :updated_at
  json.customer @delivery.customer, :id, :name, :student_number, :phone_number, :address_name, :address_lat, :address_lng, :static_pay_qr, :photo, :avatar, :created_at, :updated_at
  json.worker @delivery.worker, :id, :name, :student_number, :phone_number, :address_name, :address_lat, :address_lng, :static_pay_qr, :photo, :avatar, :created_at, :updated_at
