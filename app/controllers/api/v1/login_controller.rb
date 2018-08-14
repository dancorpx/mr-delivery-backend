class Api::V1::LoginController < Api::V1::BaseController
  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def wechat_params
    {
      appid: ENV['APP_ID'],
      secret: ENV['APP_SECRET'],
      js_code: params[:code],
      grant_type: "authorization_code"
    }
  end

  def wechat_user
    @wechat_response ||= RestClient.post(URL, wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end

  def login
    @user = User.find_or_create_by(open_id: wechat_user.fetch("openid"))
    render json: {
      userId: @user.id,
      userName: @user.name,
      userStudentNumber: @user.student_number,
      userPhoneNumber: @user.phone_number,
      userAddressName: @user.address_name,
      userAddressLat: @user.address_lat,
      userAddressLng: @user.address_lng,
      userQR: @user.static_pay_qr,
      userPhoto: @user.photo
    }
  end
end
