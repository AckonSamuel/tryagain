class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments, id: :uuid do |t|
      t.references :club, null: false, foreign_key: true, type: :uuid
      t.integer :amount_paid, null: false, index: true, default: 0
      t.string :transaction_id, null: false, index: true, default: ''
      t.string :status, null: false, index: true, default: 'pending'

      t.timestamps
    end
  end
end
