# frozen_string_literal: true

class ClubPatronSerializer < ActiveModel::Serializer
  attributes :id, :office_in_knust, :patron_name, :contact, :constitution
  has_one :club
end
