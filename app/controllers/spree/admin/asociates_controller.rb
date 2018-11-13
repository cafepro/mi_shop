module Spree
  module Admin
    class AsociatesController < ResourceController
      def index
        @asociates = Spree::Asociate.all
        # filters
        @asociates = @asociates.where("lower(name) like '%#{params[:quick_search].downcase}%'") unless params[:quick_search].blank?
        params[:q].each_pair do |field, value|
          @asociates = @asociates.where("lower(#{field}) like '%#{value}%'") unless value.blank?
        end unless params[:q].blank?
        # @asociates = @asociates.page(params[:page] || 1).per(50)
      end

      def edit
        @group_asociates = Spree::Asociate.where(link_to_asociate: @asociate.id)
      end

      def new
        @asociate = Spree::Asociate.new
      end
    end
  end
end
