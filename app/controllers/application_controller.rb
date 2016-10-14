class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    session[:local] = params[:local] if params[:local]
    I18n.locale = session[:local] || I18n.default_locale
  end
end
