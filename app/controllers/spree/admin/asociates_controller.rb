module Spree
  module Admin
    class AsociatesController < ResourceController

      before_action :set_users, only: [:index, :new, :edit]

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
        @family = @asociate.family
      end

      def new
        @parent = Spree::Asociate.find(params[:parent_id]) rescue nil
        if @parent
          @asociate = Spree::Asociate.new(link_to_asociate: @parent.id)
        else
          @asociate = Spree::Asociate.new
        end
        @asociate.asociate_identifier = @asociate.next_asociate_identifier
        @asociate.asociate_code = @asociate.next_asociate_code
      end

      private

      def set_users
        @users = Spree::User.all
      end

    end
  end
end
