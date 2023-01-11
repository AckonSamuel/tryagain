class EventSerializer < ActiveModel::Serializer
  attributes :id, :club_name, :description, :date, :location 
end
