class ApplicationController < ActionController::Base
  include CurrentPageConcern
  before_action :set_locale

  def change_locale
    locale = params[:locale]

    I18n.locale = locale
    session[:locale] = locale

    if session[:current_page_id].present?
      page = Page.find_by(id: session[:current_page_id])
      if page
        new_slug = locale.to_s == 'en' ? page.english_slug : page.slug
        redirect_path = page_path(new_slug)
      else
        redirect_path = root_path
      end
    else
      redirect_path = root_path
    end

    render json: { redirect_path: redirect_path }
  end

  private

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
