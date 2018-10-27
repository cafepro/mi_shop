class AddCompleteNameSearchToSpreeAsociates < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_asociates, :complete_name_search, :string
  end
end
