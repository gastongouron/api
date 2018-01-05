class Trip < ActiveRecord::Base

  belongs_to :user

  has_many :placements
  has_many :demands, through: :placements

  validates :title, :from_city, :to_city, :start_date, :end_date, :user_id, presence: true

  validates :price, numericality: { greater_than_or_equal_to: 0 },
                    presence: true

end
