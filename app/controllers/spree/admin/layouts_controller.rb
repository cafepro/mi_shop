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
    end
  end
end
