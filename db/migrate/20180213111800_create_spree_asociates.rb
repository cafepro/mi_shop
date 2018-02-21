class CreateSpreeAsociates < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_asociates do |t|
      t.integer :user_id, index: true, null: true, foreign_key: true
      t.integer :asociate_identifier, null: false
      t.string  :asociate_code, null: false
      t.boolean :zitron, default: true
      t.integer :link_to_asociate
      t.date    :start_date
      t.date    :end_date
      t.boolean :sepa
      t.boolean :medical_insurance, default: true
      t.string  :modality
      t.date    :insurance_start_date
      t.date    :insurance_end_date
      t.string  :relationship
      t.string  :name, null: false
      t.string  :first_surname, null: false
      t.string  :second_surname
      t.string  :document_type, null: false
      t.string  :document_number, null: false
      t.string  :sex, null: false
      t.date    :birth_date
      t.string  :street_type
      t.string  :street
      t.string  :number
      t.string  :floor
      t.string  :city
      t.string  :province
      t.string  :postal_code
      t.string  :phone_number
      t.string  :email
      t.string  :iban
      t.string  :bank
      t.string  :bank_office
      t.string  :dc
      t.string  :account
      t.float   :inscription_fee
      t.float   :incription_cuote
      t.datetime :deleted_at, default: nil
      t.timestamps
    end
  end
end
