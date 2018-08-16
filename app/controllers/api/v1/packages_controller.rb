class Api::V1::PackagesController < Api::V1::BaseController
  before_action :set_package, only: [:show, :update, :destroy]

  def index
    if params[:customer_id].present?
      @packages = Package.where(customer_id: params[:customer_id])
    else
       @packages = Package.all
    end
  end

  def available
    if params[:customer_id].present?
      @packages = Package.where(customer_id: params[:customer_id], available: true)
      @packages = @packages.select{ |package| time_valid(package.delivery_time_end) }
    else
       @packages = Package.where(available: true)
       @packages = @packages.select{ |package| time_valid(package.delivery_time_end) }
    end
  end

  def accepted
    if params[:customer_id].present?
      @packages = Package.where(customer_id: params[:customer_id], accepted: true)
    else
       @packages = Package.where(accepted: true)
    end
  end

  def completed
    if params[:customer_id].present?
      @packages = Package.where(customer_id: params[:customer_id], completed: true)
    else
       @packages = Package.where(completed: true)
    end
  end


  def show
  end

  def update
    if @package.update(package_params)
      render :show
    else
      render_error
    end
  end

  def create
    @package = Package.new(package_params)
    # @package.seller = User.find(params[:seller_id])
    @package.verification_code = random_verification_code
    if @package.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @package.destroy
    head :no_content
  end

  private

  def set_package
    @package = Package.find(params[:id])
  end

  def package_params
    params.require(:package).permit(:id, :customer_id, :name_on_package,
                                    :phone_on_package, :kuai_di_code, :size,
                                    :price, :delivery_location_name,
                                    :delivery_location_lat, :delivery_location_lng,
                                    :delivery_time_start, :delivery_time_end, :comment,
                                    :available, :accepted, :completed, :verification_code)
  end

  def render_error
    render json: { errors: @package.errors.full_messages }, status: :unprocessable_entity
  end

  def random_verification_code
    (('a'..'z').to_a + (0..9).to_a).sample(4).join
  end

  def time_valid(string)
    t = Time.now.strftime("%H:%M").tr(':', '').to_i
    string = string.tr(':', '').to_i
    t < string
  end
end
