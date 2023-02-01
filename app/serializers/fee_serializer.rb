class FeeSerializer < ActiveModel::Serializer
  attributes :id, :amount
  has_one :academic_year
  has_one :application_type
end
