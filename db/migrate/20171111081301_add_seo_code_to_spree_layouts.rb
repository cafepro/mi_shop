class AddSeoCodeToSpreeLayouts < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_layouts, :analytics_code, :text
  end
end
