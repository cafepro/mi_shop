class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include MiShopBaseController

  helper 'spree/products'
  helper 'spree/taxons'

end
