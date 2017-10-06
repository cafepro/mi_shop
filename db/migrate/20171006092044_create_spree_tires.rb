class CreateSpreeTires < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_tires do |t|
                            t.string :name
                              t.integer :size
                              t.float :preasure
                            t.timestamps
          end
  end
end
