class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments, id: :uuid do |t|
      t.references :club, null: false, foreign_key: true, type: :uuid
      t.integer :amount_paid
      t.string :status

      t.timestamps
    end
  end
end
