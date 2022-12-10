# frozen_string_literal: true

class CreatePatrons < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    create_table :patrons, id: :uuid  do |t|
      t.references :club_staff, null: false, foreign_key: true, default: ''

      t.timestamps
    end
  end
end
