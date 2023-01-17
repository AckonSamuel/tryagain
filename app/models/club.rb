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

  def profile_photo_url
    return unless self.profile_photo.attached?
    Rails.application.routes.url_helpers.url_for(profile_photo)
  end

  def banner_photo_url
    return unless self.banner_photo.attached?
    Rails.application.routes.url_helpers.url_for(banner_photo)
  end
end
