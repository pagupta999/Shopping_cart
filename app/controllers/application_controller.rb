class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller? 
 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, address_attributes: [:address_1, :address_2, :city, :state, :country, :postal_code]])
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :password, :password_confirmation, :current_password, address_attributes: [:id, :address1, :address2, :city, :state, :country, :postal_code])}
  end

end
