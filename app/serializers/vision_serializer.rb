class VisionSerializer < ActiveModel::Serializer
  attributes :id, :statement
  has_one :club
end
