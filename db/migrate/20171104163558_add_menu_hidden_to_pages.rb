class AddMenuHiddenToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_pages, :in_menu, :boolean, default: false
    add_column :spree_pages, :hidden, :boolean, default: false
  end
end
