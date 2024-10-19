class ApplicationController < ActionController::API
  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!

  def current_user
    current_devise_api_user
  end

  def check_if_admin
    return render json: {}, status: :unauthorized unless current_user.admin?
  end
end
