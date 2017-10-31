class CreateSpreeLayouts < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_layouts do |t|
                            t.string :name
                              t.text :header
                              t.text :body
                              t.text :footer
                              t.text :custom_css
                              t.text :custom_js
                              t.boolean :front_default
                              t.boolean :back_default
                            t.timestamps
          end
  end
end
