class TripsSerializer < ActiveModel::Serializer
  attributes :id, :title, :from_city, :to_city, :start_date, :end_date, :user_id, :presence
  has_one :user
end
