class ClubStudent < ApplicationRecord
  belongs_to :club
  belongs_to :student
end
