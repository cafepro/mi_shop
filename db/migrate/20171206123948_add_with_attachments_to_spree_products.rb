class AddWithAttachmentsToSpreeProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_products, :with_attachments, :boolean, default: 0
    add_column :spree_products, :min_attachments, :integer, default: 10
  end
end
