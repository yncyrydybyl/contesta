class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "he du nase da darfst du nicht ran!!!"
    redirect_to root_url
  end
  helper_method :admin?
end
