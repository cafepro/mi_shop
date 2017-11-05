module Spree
  module Admin
    class PagesController < ResourceController
      before_action :get_layouts, only: [:edit, :new, :create, :update, :clone]
      before_action :get_pages, only: [:index, :edit, :new, :create, :update, :clone]
      def index
        # @pages = Spree::Page.all
        # filters
        @pages = @pages.where("lower(name) like '%#{params[:quick_search].downcase}%'") unless params[:quick_search].blank?
        params[:q].each_pair do |field, value|
          @pages = @pages.where("lower(#{field}) like '%#{value}%'") unless value.blank?
        end unless params[:q].blank?
        @pages = @pages.page(params[:page] || 1).per(50)
      end

      def clone
        set_page

        @page = @page.dup
        @page.name = "#{@page.name} (cloned)"
      end

      private

      def set_page
        @page = Spree::Page.find(params[:id])
      end

      def get_layouts
        @layouts = Spree::Layout.all
      end

      def get_pages
        @pages = Spree::Page.all
      end
    end
  end
end
