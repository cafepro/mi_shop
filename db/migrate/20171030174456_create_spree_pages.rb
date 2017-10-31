class CreateSpreePages < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_pages do |t|
                            t.string :name
                            t.text :description
                            t.string :link
                            t.boolean :target_blank
                            t.string :title
                            t.text :keywords
                            t.text :seo_code
                            t.datetime :publish_at
                            t.datetime :expire_at
                            t.text :body
                            t.text :custom_css
                            t.text :custom_js
                            t.integer :position
                            t.integer :parent_id
                            t.references :layout
                            t.timestamps
          end
  end
end
