class PagesController < Spree::StoreController
  layout 'application'

  before_action :set_menu

  def index
    if params[:page_id].blank?
      @page = Spree::Page.all.includes(:layout).where(parent_id: 0).first rescue Spree::Page.first
    else
      @page = Spree::Page.all.includes(:layout).where(url: "/#{params['page_id']}").first
    end
    render_404 if @page.blank?
    @layout = @page.layout
  end

  private

  def set_menu
    @menu = Spree::Page.published.in_menu
  end

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
end
