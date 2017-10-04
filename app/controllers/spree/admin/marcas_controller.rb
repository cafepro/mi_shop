module Spree
  module Admin
    class MarcasController < ResourceController
      def index
        @marcas = Spree::Marca.page(params[:page] || 1).per(50)
      end
    end
  end
end
