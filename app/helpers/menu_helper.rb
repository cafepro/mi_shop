module MenuHelper
  def render_menu
    @menu = Spree::Page.published.in_menu
    render 'shared/menu'
  end
end
