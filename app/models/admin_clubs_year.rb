class AdminClubsYear < ApplicationRecord
  belongs_to :academicyear_club
  belongs_to :user
end
