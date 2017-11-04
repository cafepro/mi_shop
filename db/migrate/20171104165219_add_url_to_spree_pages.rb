class AddUrlToSpreePages < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_pages, :url, :string
  end
end
