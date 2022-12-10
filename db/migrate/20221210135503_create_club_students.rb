class CreateClubStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :club_students do |t|
      t.references :club, null: false, foreign_key: true, default: ""
      t.references :student, null: false, foreign_key: true, default: ""
      
      t.timestamps
    end
  end
end
