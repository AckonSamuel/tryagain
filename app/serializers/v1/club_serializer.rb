class V1::ClubSerializer < ActiveModel::Serializer
    attributes (
      :id,
      :email,
      :name,
      :group,
      :telephone_number
    )
  end