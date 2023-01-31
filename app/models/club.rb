# frozen_string_literal: true

class Club < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :validatable, :confirmable,
         :jwt_authenticatable, :recoverable, :rememberable, jwt_revocation_strategy: self

  has_many :project, dependent: :destroy
  has_many :event, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_one_attached :profile_photo
  has_one_attached :banner_photo
  has_one_attached :registration_application_letter
  has_many_attached :passport_photos
  has_one_attached :constitution
  has_one_attached :endorsement_letter
  has_many :club_executives, dependent: :destroy
  has_many :club_patrons, dependent: :destroy

  def profile_photo_url
    return "" unless self.profile_photo.attached?
    self.profile_photo.attachment.url
  end

  def banner_photo_url
    return "" unless self.banner_photo.attached?
    self.banner_photo.attachment.url
  end

  def registration_application_letter_url
    return "" unless self.registration_application_letter.attached?
    self.registration_application_letter.attachment.url
  end

  def constitution_url
    return "" unless self.constitution.attached?
    self.constitution.attachment.url
  end

  def endorsement_letter_url
    return "" unless self.endorsement_letter.attached?
    self.endorsement_letter.attachment.url
  end

  def passport_photos_url
    return ["", ""] unless self.passport_photos.attached?
    self.passport_photos.attachments.map{|l| l.url}
  end
end