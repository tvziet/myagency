module CurrentPageConcern
  extend ActiveSupport::Concern

  included do
    helper_method :current_page
    before_action :store_current_page
  end

  def current_page
    @current_page ||= begin
      if params[:slug].present?
        page = Page.where('slug = ? OR english_slug = ?', params[:slug], params[:slug]).first
        session[:current_page_id] = page&.id
        page
      elsif session[:current_page_id].present?
        Page.find_by(id: session[:current_page_id])
      end
    end
  end

  private

  def store_current_page
    if params[:slug].present?
      page = Page.where('slug = ? OR english_slug = ?', params[:slug], params[:slug]).first
      session[:current_page_id] = page&.id
    end
  end
end
