class CreateSpreePageImages < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_page_images do |t|
                            t.string :title
                              t.string :alt
                                    t.timestamps
          end
  end
end
