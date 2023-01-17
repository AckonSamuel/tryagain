# frozen_string_literal: true

  class ClubSerializer < ActiveModel::Serializer
    attributes :id, :email, :club_name, :group, :telephone_number, :banner_photo, :profile_photo, :history, :description, :meeting_location, :meeting_time
  end

