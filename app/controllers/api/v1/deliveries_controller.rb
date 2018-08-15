class Api::V1::DeliveriesController < Api::V1::BaseController
  before_action :set_delivery, only: [:show, :update, :destroy]

  def index
    if params[:worker_id].present?
      @deliveries = Delivery.where(worker_id: params[:worker_id])
    else
      @deliveries = Delivery.all
    end
  end

  def accepted
    if params[:worker_id].present?
      @deliveries = Delivery.where(worker_id: params[:worker_id]).select{ |delivery| delivery.package.accepted }
    else
       @deliveries = Delivery.all.select{ |delivery| delivery.package.accepted}
    end
  end

  def completed
    if params[:worker_id].present?
      @deliveries = Delivery.where(worker_id: params[:worker_id]).select{ |delivery| delivery.package.completed }
    else
       @deliveries = Delivery.all.select{ |delivery| delivery.package.completed}
    end
  end

  def show
  end

  def update
    if @delivery.update(delivery_params)
      render :show
    else
      render_error
    end
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @delivery.destroy
    head :no_content
  end

  private

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  def delivery_params
    params.require(:delivery).permit(:id, :package_id, :worker_id)
  end

  def render_error
    render json: { errors: @delivery.errors.full_messages }, status: :unprocessable_entity
  end
end
