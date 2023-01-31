# frozen_string_literal: true

class Event < ApplicationRecord
  has_one_attached :image
  belongs_to :club

  # validates :image, presence: true

  def project_image
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
