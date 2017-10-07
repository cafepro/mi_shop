module Spree
  module Admin
    class TemplatesController < ResourceController
      def index
        @templates = Spree::Template.all
        # filters
        @templates = @templates.where("lower(name) like '%#{params[:quick_search].downcase}%'") unless params[:quick_search].blank?
        params[:q].each_pair do |field, value|
          @templates = @templates.where("lower(#{field}) like '%#{value}%'") unless value.blank?
        end unless params[:q].blank?
        @templates = @templates.page(params[:page] || 1).per(50)
      end
    end
  end
end
