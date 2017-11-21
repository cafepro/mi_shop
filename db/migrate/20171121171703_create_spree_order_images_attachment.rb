class CreateSpreeOrderImagesAttachment < ActiveRecord::Migration[5.1]
  def change
    add_attachment :spree_order_images, :attachment
  end
end
