# frozen_string_literal: true

class DeviseCreateClubs < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    create_table :clubs, id: :uuid  do |t|

      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :club_name, null: false, default: ''
      t.integer :telephone_number, null: false, default: 0
      t.string :group, null: false, default: ''
      t.string :description, null: false, default: ''
      t.string :history, null: false, default: ''
      t.string :meeting_time, null: false, default: ''
      t.string :meeting_location, null: false, default: ''
      t.string :possible_membership_size, null: false, default: 0
      t.boolean :status, null: false, default: 'pending'
      t.string :application_type, null: false, default: 'new registration'
      t.references :academic_year, null: false, foreign_key: true, type: :uuid
      t.integer :amount_due, null: false, default: 0
      t.integer :has_submitted, null: false, default: false
      t.string :is_approved, null: false, default: 'Not Approved'

      t.timestamps null: false
    end

    add_index :clubs, :email,                unique: true
    add_index :clubs, :reset_password_token, unique: true
    add_index :clubs, :confirmation_token,   unique: true
    # add_index :clubs, :unlock_token,         unique: true
  end
end
