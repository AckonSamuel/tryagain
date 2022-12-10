class V1::StudentSerializer < ActiveModel::Serializer
    attributes (
      :id,
      :name,
      :email,
      :phone_number,
      :programme_name
    )
  end 