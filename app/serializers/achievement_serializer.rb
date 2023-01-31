# frozen_string_literal: true

class AchievementSerializer < ActiveModel::Serializer
  attributes :id, :achievement_name, :description, :status
end
