class HomeController < ApplicationController
  def index
    session[:current_page_id] = nil
  end
end
