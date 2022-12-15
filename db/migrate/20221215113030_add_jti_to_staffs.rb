# frozen_string_literal: true

class AddJtiToStaffs < ActiveRecord::Migration[7.0]
  def change
    add_column :staffs, :jti, :string, null: false, default: ''
    add_index :staffs, :jti
  end
end
