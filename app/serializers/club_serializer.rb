# frozen_string_literal: true

  class ClubSerializer < ActiveModel::Serializer
    attributes :id, :email, :club_name, :group, :telephone_number, :banner_photo_url, :profile_photo_url, :history, :description, :meeting_location, :meeting_time
  end

