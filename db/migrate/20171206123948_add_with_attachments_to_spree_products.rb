class AddWithAttachmentsToSpreeProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_products, :with_attachments, :boolean, default: 0
  end
end
