class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include MiShopBaseController

  before_action :para


end
