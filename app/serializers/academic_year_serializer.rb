class AcademicYearSerializer < ActiveModel::Serializer
  attributes :id, :start_year, :end_year, :is_active
end
