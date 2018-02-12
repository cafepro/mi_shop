# Configurations Manager
class ConfigManager
  @configurations = {}

  private
  # load configurations from models to memory
  def self.load_configurations
    Spree::Configuration.all.each do |config|
      @configurations[config.key] = config.value
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
    @configurations[key]
  end
end
