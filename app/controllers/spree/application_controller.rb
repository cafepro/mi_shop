module Spree
  class ApplicationController < ApplicationController
    before_action :set_layout

    private

    def set_layout
      @layout = get_shop_layout
    end
  end
end
