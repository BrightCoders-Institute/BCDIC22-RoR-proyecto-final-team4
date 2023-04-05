class RegistrationsController < Devise::RegistrationsController
  
    private
    def sign_up_params
      params.require(:user).permit(:email, :name, :password)
    end
    
    before_action :configure_permitted_parameters

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    
  end
  