class Seat < ApplicationRecord
  belongs_to :school
  belongs_to :home_address
end
