class AbilityDecorator
  include CanCan::Ability
  def initialize(user)
    can :upload_photos, Spree::Order
  end
end

Spree::Ability.register_ability(AbilityDecorator)
