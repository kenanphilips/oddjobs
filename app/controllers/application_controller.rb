class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_profile
    @profile = Profile.find_by_user_id(current_user.id)
  end
  helper_method :current_profile

  def get_phone_number(user)
    profile = Profile.find_by_user_id(user.id)
    if profile
      profile.phone_number
    end
  end
  helper_method :get_phone_number

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :student])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :student])
  end


end
