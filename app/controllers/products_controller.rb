class ProductsController < ActionController::Base
  layout 'application'

  before_action :set_layout


  def index

  end

  private

  def set_layout
      get_back_layout
  end

end
