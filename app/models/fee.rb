class Fee < ApplicationRecord
  belongs_to :academic_year
  belongs_to :application_type
end
