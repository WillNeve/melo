class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :authenticate_user!, only: :landing

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name username email phone_number avatar])

    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name username avatar])
  end
end
