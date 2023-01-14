class CreateObjectives < ActiveRecord::Migration[7.0]
  def change
    create_table :objectives, id: :uuid do |t|
      t.references :club, null: false, foreign_key: true, type: :uuid
      t.string :statement, null: false, default: ""

      t.timestamps
    end
  end
end
