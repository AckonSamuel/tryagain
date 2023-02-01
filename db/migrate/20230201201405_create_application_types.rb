class CreateApplicationTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :application_types, id: :uuid do |t|
      t.boolean :registration
      t.boolean :renewal

      t.timestamps
    end
  end
end
