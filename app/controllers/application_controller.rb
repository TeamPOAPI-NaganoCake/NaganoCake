class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana,
                                                       :zip_code, :address, :phone_number])
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admins_homes_top_path
    else
      root_path
    end
  end

end