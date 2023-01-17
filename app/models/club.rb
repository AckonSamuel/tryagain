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
    self.profile_photo.attachment.url
    # default_url_options = Rails.application.config.action_controller.default_url_options
    # Rails.application.routes.url_helpers.rails_blob_path(self.profile_photo, default_url_options[:host])
  end

  def banner_photo_url
    return unless self.banner_photo.attached?
    self.banner_photo.attachment.url
    # default_url_options = Rails.application.config.action_controller.default_url_options
    # Rails.application.routes.url_helpers.rails_blob_path(self.banner_photo, default_url_options[:host])
  end
  
end
