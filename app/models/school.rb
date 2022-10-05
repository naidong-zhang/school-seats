class School < ApplicationRecord
  validates :name, presence: true

  belongs_to :school_division_ward

  has_many :seats
  has_many :home_addresses, through: :seats
end
