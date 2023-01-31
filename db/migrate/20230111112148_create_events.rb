# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events, id: :uuid do |t|
      t.string :event_name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.string :date, null: false, default: ''
      t.string :location, null: false, default: ''
      t.string :time, null: false, default: ''
      t.references :club, null: false, foreign_key: true, default: '', type: :uuid

      t.timestamps
    end
  end
end
