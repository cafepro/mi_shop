module MiShopBaseController

  def self.included(base)
  end

  module InstanceMethods

    private

    def get_default_layout
      Layout.where(front_default: true).first
    end


    def get_back_layout
      Layout.where(back_default: true).first rescue Layout.first
    end

    def get_shop_layout
      Layout.where(name: "tienda").first rescue get_back_layout
    end

  end

  module ClassMethods

  end
end
