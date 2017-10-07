class CreateSpreeBrands < ActiveRecord::Migration[5.1]
  def up
    Spree::Brand.create_translation_table!({
      name: :string,
      description: :text,
    })
  end
  def down
    Spree::Brand.drop_translation_table!
  end
end
