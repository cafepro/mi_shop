module Spree
  module Admin
    class TiresController < ResourceController
      def index
        @tires = Spree::Tire.page(params[:page] || 1).per(50)
      end
    end
  end
end
