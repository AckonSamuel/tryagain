# frozen_string_literal: true

class Club < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, :recoverable, :rememberable, jwt_revocation_strategy: self

  has_many :club_student
  has_many :club_staff
  has_many :project
  has_many :event
  has_many :achievements
  has_one_attached :profile_photo
  has_one_attached :banner_photo
  has_one_attached :registration_application_letter
  has_many_attached :passport_photos
  has_one_attached :constitution
  has_one_attached :endorsement_letter
  has_many :club_executives
  has_many :club_patrons

  def profile_photo_url
    return unless self.profile_photo.attached?
    self.profile_photo.attachment.url
  end

  def banner_photo_url
    return unless self.banner_photo.attached?
    self.banner_photo.attachment.url
  end

  def registration_application_letter_url
    return unless self.registration_application_letter.attached?
    self.registration_application_letter.attachment.url
  end

  def constitution_url
    return unless self.constitution.attached?
    self.constitution.attachment.url
  end

  def endorsement_letter_url
    return unless self.endorsement_letter.attached?
    self.endorsement_letter.attachment.url
  end

  def passport_photos_url
    return [] unless self.passport_photos.attached?
    self.passport_photos.attachment.url
  end
end