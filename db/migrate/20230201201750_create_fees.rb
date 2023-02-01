class CreateFees < ActiveRecord::Migration[7.0]
  def change
    create_table :fees, id: :uuid do |t|
      t.integer :amount
      t.references :academic_year, null: false, foreign_key: true, type: :uuid
      t.references :application_type, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
