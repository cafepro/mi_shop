class ChangeNotNullDniColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :spree_asociates, :document_number, :string, null: true
  end
end
