class ApplicationController < ActionController::Base
#  include OmniauthCallbacksHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  rescue_from ActiveRecord::RecordNotFound, with: :render_404
#  rescue_from ActionController::RoutingError, with: :render_404
  protect_from_forgery with: :exception
  before_action :set_request_from
  before_action :configure_permitted_parameters, if: :devise_controller?

  # どこのページからリクエストが来たか保存しておく

  def set_request_from
    if session[:request_from]
      @request_from = session[:request_from]
    end
    # 現在のURLを保存しておく
    session[:request_from] = request.original_url
  end
  # 前の画面に戻る
  def return_back
    if request.referer
      redirect_to :back and return
    elsif @request_from
      redirect_to @request_from and return
    end
    return false
  end  

  protected
  
# https://dev.9bar.tokyo/rails/devise-strong-paramaters
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:account_update) << :username
  end

#  private
#  def logged_in_user
#    unless logged_in?
#      store_location
#      flash[:danger] = "Please log in."
#      redirect_to login_url
#    end
#  end  



#  def render_404

#  render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
#  end


end
