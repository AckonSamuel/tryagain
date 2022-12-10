# frozen_string_literal: true

class CreateClubStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :club_staffs do |t|
      t.references :club, null: false, foreign_key: true
      t.references :staff, null: false, foreign_key: true

      t.timestamps
    end
  end
end
