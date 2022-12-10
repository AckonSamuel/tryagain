class CreateClubStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :club_students do |t|

      t.timestamps
    end
  end
end
