module Spree
  module Admin
    class PageImagesController < ResourceController
      def index
        @page_images = Spree::PageImage.all
        # filters
        @page_images = @page_images.where("lower(title) like '%#{params[:quick_search].downcase}%'") unless params[:quick_search].blank?
        params[:q].each_pair do |field, value|
          @page_images = @page_images.where("lower(#{field}) like '%#{value}%'") unless value.blank?
        end unless params[:q].blank?
        @page_images = @page_images.page(params[:page] || 1).per(50)
      end
    end
  end
end
