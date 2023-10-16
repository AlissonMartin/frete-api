class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :federal_tax_id
      t.references :owner, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
