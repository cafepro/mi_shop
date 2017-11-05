class AbilityDecorator
  include CanCan::Ability
  def initialize(user)
      cannot :edit, Tolk::LocalesController
  end
end

Spree::Ability.register_ability(AbilityDecorator)
