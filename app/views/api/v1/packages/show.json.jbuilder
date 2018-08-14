json.extract! @package, :id, :customer_id, :name_on_package, :phone_on_package, :kuai_di_code, :size, :category, :price, :delivery_location_name, :delivery_location_lat,:delivery_location_lng, :delivery_time_start, :delivery_time_end, :comment, :available,:accepted, :completed, :verification_code, :created_at, :updated_at
    json.seller @package.customer, :id, :name, :student_number, :phone_number, :address_name, :address_lat, :address_lng, :static_pay_qr, :photo, :created_at, :updated_at
    json.delivery do
      if @package.delivery.blank?
        json.null!
      else
        json.delivery @package.delivery, :id, :package_id, :worker_id, :created_at, :updated_at
      end
    end
