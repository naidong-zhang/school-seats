class HomeAddress < ApplicationRecord
  validates :street_name, :street_number, presence: true
  validates :street_number, numericality: { only_integer: true }

  belongs_to :school_division_ward

  has_many :seats
  has_many :schools, through: :seats
end
