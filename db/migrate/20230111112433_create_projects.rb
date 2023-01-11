class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :project_name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.string :status, null: false, default: ''
      t.references :club, null: false, foreign_key: true, default: '', type: :uuid

      t.timestamps
    end
  end
end
