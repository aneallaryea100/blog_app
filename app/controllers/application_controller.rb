class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name bio email password current_password])
  end
  # def current_ability
  #   model_name = controller_name.classify
  #   @current_ability ||= "#{model_name}Ability".constantize.new(current_user)
  # end
end
