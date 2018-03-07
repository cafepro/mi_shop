# Configurations Manager
class ConfigManager
  @configurations = {}

  private
  # load configurations from models to memory
  # parsing some values to boolean or number format
  # returns all configurations hash
  def self.load_configurations
    Spree::Configuration.all.each do |config|
      if (Float(config.value) rescue false)
        if config.value.to_f - config.value.to_i == 0
          @configurations[config.key] = config.value.to_i
          if @configurations[config.key] == 1
            @configurations[config.key] = true
          elsif @configurations[config.key] == 0
            @configurations[config.key] = false
          end
        else
          @configurations[config.key] = config.value.to_f
        end
      else
        @configurations[config.key] = config.value
      end
    end
    @configurations
  end

  public
  # Clear configs variable
  # @return (Empty Hash) values
  def self.clear_values
    @configurations = {}
  end

  # Return configurations variable
  # @return (Hash) values
  def self.get_all
    load_configurations if @configurations == {}
    @configurations
  end

  # Return configurations value
  # @return (string) values
  def self.value(key)
    return nil if key.blank?
    load_configurations if @configurations == {}
    @configurations[key.to_s]
  end
end
