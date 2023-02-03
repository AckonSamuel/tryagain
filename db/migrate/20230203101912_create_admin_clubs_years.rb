class CreateAdminClubsYears < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_clubs_years, id: :uuid do |t|
      t.references :academicyear_club, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
