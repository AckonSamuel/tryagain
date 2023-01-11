# frozen_string_literal: true

class Club < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, :recoverable, :rememberable, jwt_revocation_strategy: self

  has_many :club_student
  has_many :club_staff
  has_many :project
  has_many :event
  has_many :achievements
end
