# frozen_string_literal: true

class Club < ApplicationRecord
  has_many :club_student
  has_many :club_staff
end
