# frozen_string_literal: true

class ClubExecutiveSerializer < ActiveModel::Serializer
  attributes :id, :portfolio, :executive_name, :contact, :programme, :email
  has_one :club
end
