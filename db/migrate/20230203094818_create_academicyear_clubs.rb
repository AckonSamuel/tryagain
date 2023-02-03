class CreateAcademicyearClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :academicyear_clubs, id: :uuid do |t|
      t.references :club, null: false, foreign_key: true, type: :uuid
      t.references :academic_year, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
