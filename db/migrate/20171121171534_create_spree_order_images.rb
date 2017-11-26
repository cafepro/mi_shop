class CreateSpreeOrderImages < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_order_images do |t|
      t.references :order
      t.references :product
      t.string :title
      t.string :alt
      t.timestamps
    end
  end
end
