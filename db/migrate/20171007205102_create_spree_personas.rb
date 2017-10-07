class CreateSpreePersonas < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_personas do |t|
                            t.string :nombre
                              t.string :apellidos
                              t.text :descripcion
                            t.timestamps
          end
  end
end
