module Spree
  module Admin
    class LayoutsController < ResourceController
      def index
        @layouts = Spree::Layout.all
        # filters
        @layouts = @layouts.where("lower(name) like '%#{params[:quick_search].downcase}%'") unless params[:quick_search].blank?
        params[:q].each_pair do |field, value|
          @layouts = @layouts.where("lower(#{field}) like '%#{value}%'") unless value.blank?
        end unless params[:q].blank?
        @layouts = @layouts.page(params[:page] || 1).per(50)
      end

      def clone
        set_layout

        @layout = @layout.dup
        @layout.name = "#{@layout.name} (cloned)"
      end

      private

      def set_layout
        @layout = Spree::Layout.find(params[:id])
      end
    end
  end
end
