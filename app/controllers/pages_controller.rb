class PagesController < ApplicationController
  def show
    @page = current_page

    unless @page
      session[:current_page_id] = nil
      redirect_to root_path
    end
  end
end
