class CreateClubPatrons < ActiveRecord::Migration[7.0]
  def change
    create_table :club_patrons, id: :uuid do |t|
      t.string :office_in_knust, null: false, default: ''
      t.string :patron_name, null: false, default: ''
      t.integer :contact, null: false, default: 0
      t.string :constitution, null: false, default: ''
      t.references :club, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
