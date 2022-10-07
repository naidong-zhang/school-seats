class School < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :nursery, :kindergarten, :grade1, :grade2, :grade3, :grade4, :grade5, :grade6, :grade7,
            :grade8, :grade9, :grade10, :grade11, :grade12, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :school_division_ward

  has_many :seats
  has_many :home_addresses, through: :seats

  paginates_per 50
end
