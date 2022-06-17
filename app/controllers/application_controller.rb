class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #deviseで名前、画像、自己紹介を登録できるようにする
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name ,:image ,:introduction ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name ,:image ,:introduction ])
  end
  #---------------------------------------------------
  
end
