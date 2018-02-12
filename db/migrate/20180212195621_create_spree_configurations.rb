class CreateSpreeConfigurations < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_configurations do |t|
                            t.string :key
                            t.string :value
                            t.boolean :editable, default: true
                            t.timestamps
          end
  end
end
