class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_pages do |t|
      t.string :name
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
