# frozen_string_literal: true

class CreateClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.integer :telephone_number
      t.string :group

      t.timestamps
    end
  end
end
