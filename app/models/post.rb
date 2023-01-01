class Post < ApplicationRecord
    has_one_attached :image

    validates :caption, :image, presence: true

    def imageUrl
        Rails.application.routes.url_helpers.url_for(image) if image.attached?
    end
end
