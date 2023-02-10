class CreateAcademicYears < ActiveRecord::Migration[7.0]
  def change
    create_table :academic_years, id: :uuid do |t|
      t.string :start_year
      t.string :end_year
      t.boolean :is_active
      t.references :admin, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
