module Spree
  module Admin
    class PersonasController < ResourceController
      def index
        @personas = Spree::Persona.all
        # filters
        @personas = @personas.where("lower(name) like '%#{params[:quick_search].downcase}%'") unless params[:quick_search].blank?
        params[:q].each_pair do |field, value|
          @personas = @personas.where("lower(#{field}) like '%#{value}%'") unless value.blank?
        end unless params[:q].blank?
        @personas = @personas.page(params[:page] || 1).per(50)
      end
    end
  end
end
