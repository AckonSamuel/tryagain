# frozen_string_literal: true

class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :project_name, :description, :status
end
