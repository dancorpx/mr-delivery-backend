class Api::V1::UsersController < Api::V1::BaseController

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      render json: @user
    else
      render_error
    end
  end

  private

   def user_params
    params.require(:user).permit(:id, :name, :student_number, :phone_number, :address_name, :address_lat, :address_lng, :static_pay_qr, :photo, :avatar, :created_at, :updated_at)
  end

  def render_error
    render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
  end
end
