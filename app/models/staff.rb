# frozen_string_literal: true

class Staff < ApplicationRecord
  has_many :club_student
end
