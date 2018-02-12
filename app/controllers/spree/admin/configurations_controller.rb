module Spree
  module Admin
    class ConfigurationsController < ResourceController
      def index
        @configurations = Spree::Configuration.all
        # filters
        @configurations = @configurations.where("lower(name) like '%#{params[:quick_search].downcase}%'") unless params[:quick_search].blank?
        params[:q].each_pair do |field, value|
          @configurations = @configurations.where("lower(#{field}) like '%#{value}%'") unless value.blank?
        end unless params[:q].blank?
        @configurations = @configurations.page(params[:page] || 1).per(50)
      end
    end
  end
end
