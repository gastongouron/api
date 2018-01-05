class Placement < ActiveRecord::Base
  belongs_to :demand, inverse_of: :placement
  belongs_to :trip, inverse_of: :placements
end
