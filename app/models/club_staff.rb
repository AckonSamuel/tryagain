class ClubStaff < ApplicationRecord
    belongs_to :club
  belongs_to :staff
  has_many :patron
end
