class CreateClubExecutives < ActiveRecord::Migration[7.0]
  def change
    create_table :club_executives, id: :uuid do |t|
      t.string :portfolio, null: false, default: ''
      t.string :executive_name, null: false, default: ''
      t.integer :contact, null: false, default: 0
      t.string :programme, null: false, default: ''
      t.string :email, null: false, default: ''
      t.references :club, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
