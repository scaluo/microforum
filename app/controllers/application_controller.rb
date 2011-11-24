class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_local
  protected
  def set_local

     if params[:locale]&&["en","zh_cn"].include?(params[:locale])

         session[:locale]=params[:locale]

     end

     I18n.locale = session[:locale]||I18n.default_locale

  end
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'scaluo' && password == 'bg3721_monkey'
    end
  end



end
