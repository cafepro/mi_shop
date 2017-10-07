class CreateSpreeTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_templates do |t|
                            t.string :name
                              t.text :header
                              t.text :body
                              t.text :footer
                              t.text :custom_css
                              t.text :custom_js
                            t.timestamps
          end
  end
end
