class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :project_name, :description, :status
end
