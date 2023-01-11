class CreateAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :achievements, id: :uuid do |t|
      t.string :achievement_name, null: false, default: ''
      t.string :year, null: false, default: ''
      t.string :description, null: false, default: ''
      t.references :club, null: false, foreign_key: true, default: '', type: :uuid

      t.timestamps
    end
  end
end
