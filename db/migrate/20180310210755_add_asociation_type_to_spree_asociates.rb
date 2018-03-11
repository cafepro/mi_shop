class AddAsociationTypeToSpreeAsociates < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_asociates, :asociation_type, :string
  end
end
