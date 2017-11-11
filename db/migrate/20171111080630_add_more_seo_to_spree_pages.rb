class AddMoreSeoToSpreePages < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_pages, :no_index, :boolean, default: false
    add_column :spree_pages, :no_follow, :boolean, default: false
  end
end
