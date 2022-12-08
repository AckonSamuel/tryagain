class CreatePatrons < ActiveRecord::Migration[7.0]
  def change
    create_table :patrons do |t|
      t.references :club_staff, null: false, foreign_key: true

      t.timestamps
    end
  end
end
