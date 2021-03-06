class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_categories,:set_permission,:set_roles
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?


  def set_categories
  	 @categories = Category.all
  end
  def set_permission
  	 @permission = Permission.all
  end
  def set_roles
    @rolesnew = Role.all
    @roles = Role.where.not(nombre: 'Public').where.not(nombre: 'Private')
  end
protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password,:role_id) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password,:role_id) }
    end
end
