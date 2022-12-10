class V1::StaffSerializer < ActiveModel::Serializer
    attributes (
      :id,
      :name,
      :email,
      :phone_number,
      :role
    )
  end 