# frozen_string_literal: true

class Student < ApplicationRecord
  has_many :club_student
end
