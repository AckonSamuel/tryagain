# frozen_string_literal: true

module V1
  class ClubSerializer < ActiveModel::Serializer
    attributes :id, :email, :name, :group, :telephone_number
  end
end
