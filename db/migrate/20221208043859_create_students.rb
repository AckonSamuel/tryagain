# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :phone_number
      t.string :programme_name

      t.timestamps
    end
  end
end
