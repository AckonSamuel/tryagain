class AcademicYear < ApplicationRecord
    belongs_to :admin, class_name: 'Admin', foreign_key: 'admin_id'
    has_many :clubs, dependent: :destroy
end
