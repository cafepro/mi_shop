class CreateSpreePageImagesAttachments < ActiveRecord::Migration[5.1]
  def change
    add_attachment :spree_page_images, :attachment
  end
end
