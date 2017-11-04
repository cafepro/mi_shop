class PagesController < ActionController::Base
  layout 'application'

  before_action :set_menu

  def index
    if params[:page_id].blank?
      @page = Spree::Page.all.includes(:layout).where(parent_id: 0).first rescue Spree::Page.first
    else
      @page = Spree::Page.all.includes(:layout).where(url: "/#{params['page_id']}").first
    end
  end

  private

  def set_menu
    @menu = Spree::Page.in_menu
  end
end
