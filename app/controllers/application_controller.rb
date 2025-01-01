class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_locale

  def change_locale
    locale = params[:locale].to_s.strip.to_sym
    if I18n.available_locales.include?(locale)
      session[:locale] = locale
      I18n.locale = locale
    end

    respond_to do |format|
      format.turbo_stream { head :ok }
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  private

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
