class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_paramaters, if: :devise_controller?
  # Whitelist the following form fields so that we can process them, if coming 
  # from a devise signup form
  protected
    def configure_permitted_paramaters
       devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:stripe_card_token, :email, :password, :password_confirmation) } 
    end
end
