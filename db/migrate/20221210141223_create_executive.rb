class CreateExecutive < ActiveRecord::Migration[7.0]
  def change
    create_table :executives do |t|
      t.string :portfolio
      t.references :club_student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
