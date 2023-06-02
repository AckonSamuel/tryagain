class Payment < ApplicationRecord
  belongs_to :club, class_name: 'Club'
end
