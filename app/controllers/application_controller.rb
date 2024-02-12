# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :danger
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_user!
    if user_signed_in?
      super
     else
      redirect_to root_path, danger: 'ログインしてください'
    end
  end
  
  protected
  
  def configure_permitted_parameters
  	# サインアップ時にnameを許可する
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  	# アカウント情報の更新時にnameを許可する
  	devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
