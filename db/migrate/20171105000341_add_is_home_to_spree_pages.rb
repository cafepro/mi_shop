class AddIsHomeToSpreePages < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_pages, :is_home, :boolean, default: false
  end
end
