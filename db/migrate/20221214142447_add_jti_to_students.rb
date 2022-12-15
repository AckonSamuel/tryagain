# frozen_string_literal: true

class AddJtiToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :jti, :string, null: false, default: ''
    add_index :students, :jti
  end
end
