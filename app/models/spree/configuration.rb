module Spree
  class Configuration < Spree::Base
    # validations
    validates :key, :value, presence: true
    # callbacks
    before_validation :check_editable
    before_save :parameterize_key
    after_save :reload_configurations
    before_destroy :check_editable

    private

    def check_editable
      if !self.editable && !self.new_record?
        self.errors.add(:editable, I18n.t('.not_editable'))
      end
    end

    def parameterize_key
      self.key = self.key.parameterize
    end

    def reload_configurations
      ConfigManager.clear_values
    end
  end
end
