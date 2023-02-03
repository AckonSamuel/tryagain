# frozen_string_literal: true

class Club < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :validatable, :confirmable,
         :jwt_authenticatable, :recoverable, :rememberable, jwt_revocation_strategy: self

  has_one_attached :profile_photo
  has_one_attached :banner_photo
  has_one_attached :registration_application_letter
  has_many_attached :passport_photos
  has_one_attached :constitution
  has_one_attached :endorsement_letter
  has_many :club_executives, dependent: :destroy
  has_many :club_patrons, dependent: :destroy

  def profile_photo_url
    return '' unless profile_photo.attached?

    profile_photo.attachment.url
  end

  def banner_photo_url
    return '' unless banner_photo.attached?

    banner_photo.attachment.url
  end

  def registration_application_letter_url
    return '' unless registration_application_letter.attached?

    registration_application_letter.attachment.url
  end

  def constitution_url
    return '' unless constitution.attached?

    constitution.attachment.url
  end

  def endorsement_letter_url
    return '' unless endorsement_letter.attached?

    endorsement_letter.attachment.url
  end

  def passport_photos_url
    return ['', ''] unless passport_photos.attached?

    passport_photos.attachments.map(&:url)
  end
end
