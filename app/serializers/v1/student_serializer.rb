# frozen_string_literal: true

module V1
  class StudentSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :phone_number, :programme_name
  end
end
