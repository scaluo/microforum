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




end
