# frozen_string_literal: true

class ClubStudent < ApplicationRecord
  belongs_to :club
  belongs_to :student
end
