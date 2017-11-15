module MiShopBaseController

  def get_default_layout
    Spree::Layout.where(front_default: true).first
  end


  def get_back_layout
    Spree::Layout.where(back_default: true).first rescue Layout.first
  end

  def get_shop_layout
    Spree::Layout.where(name: "tienda").first rescue get_back_layout
  end

  def get_main_menu
    Spree::Page.published.in_menu
  end

end
