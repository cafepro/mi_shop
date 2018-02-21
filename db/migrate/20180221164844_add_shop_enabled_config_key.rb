class AddShopEnabledConfigKey < ActiveRecord::Migration[5.1]
  def change
    Spree::Configuration.create(key: 'shop_enabled',
                                value: 'true',
                                editable: 0)
  end
end
