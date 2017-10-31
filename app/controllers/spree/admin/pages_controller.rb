module Spree
  module Admin
    class PagesController < ResourceController
      def index
        @pages = Spree::Page.all
        # filters
        @pages = @pages.where("lower(name) like '%#{params[:quick_search].downcase}%'") unless params[:quick_search].blank?
        params[:q].each_pair do |field, value|
          @pages = @pages.where("lower(#{field}) like '%#{value}%'") unless value.blank?
        end unless params[:q].blank?
        @pages = @pages.page(params[:page] || 1).per(50)
      end
    end
  end
end
