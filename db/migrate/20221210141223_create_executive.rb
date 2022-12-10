# frozen_string_literal: true

class CreateExecutive < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    create_table :executives, id: :uuid do |t|
      t.string :portfolio
      t.references :club_student, null: false, foreign_key: true, default: ''

      t.timestamps
    end
  end
end
