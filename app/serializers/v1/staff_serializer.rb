# frozen_string_literal: true

module V1
  class StaffSerializer < ActiveModel::Serializer
    attributes :id, :staff_name, :email, :phone_number, :role
  end
end
