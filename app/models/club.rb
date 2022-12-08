class Club < ApplicationRecord
    has_many :club_student
    has_many :club_staff
end
