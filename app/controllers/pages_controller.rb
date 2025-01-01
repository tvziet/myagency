class PagesController < ApplicationController
  def show
    @page = Page.where('slug LIKE ? OR english_slug LIKE ?', params[:slug], params[:slug]).first
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
