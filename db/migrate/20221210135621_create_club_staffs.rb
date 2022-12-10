class CreateClubStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :club_staffs do |t|
      t.references :club, null: false, foreign_key: true, default: ""
      t.references :staff, null: false, foreign_key: true, default: ""

      t.timestamps
    end
  end
end
