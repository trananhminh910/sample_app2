class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :set_locale

  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "login_please"
      redirect_to login_url
    end
  end
end
