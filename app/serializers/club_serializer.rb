# frozen_string_literal: true

class ClubSerializer < ActiveModel::Serializer
  attributes :id, :email, :club_name, :group, :telephone_number, :banner_photo_url, :profile_photo_url, :history,
             :description, :meeting_location, :meeting_time, :constitution_url, :endorsement_letter_url, :passport_photos_url, :registration_application_letter_url
  has_many :club_executives
  has_many :club_patrons
end
