class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

 def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end


  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:user) << :first_name
  
    devise_parameter_sanitizer.for(:user) << :last_name
    devise_parameter_sanitizer.for(:user) << :interests

    
  end
  
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
