class CreateFees < ActiveRecord::Migration[7.0]
  def change
    create_table :fees, id: :uuid do |t|
      t.integer :amount, null: false, default: 0
      t.references :academic_year, null: false, foreign_key: true, type: :uuid
      t.string :application_type, null: false, default: "new registration"

      t.timestamps
    end
  end
end
