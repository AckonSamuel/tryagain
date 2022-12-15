class AddJtiToClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :jti, :string, null: false, default: ''
    add_index :clubs, :jti
  end
end
