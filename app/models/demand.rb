class Demand < ActiveRecord::Base

  belongs_to :user

  has_one :placement
  has_one :trip, through: :placement

  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, :weight, :user_id, presence: true

end
