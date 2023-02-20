class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(current_user)
    groups_path
  end

  def after_sign_out_path_for(current_user)
    root_path
  end

  private

  def after_sign_out_path_for(*)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name password password_confirmation])
  end
end
