class AdminSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :other_names

  has_many :academic_years
end
