class CreateClubStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :club_staffs do |t|

      t.timestamps
    end
  end
end
