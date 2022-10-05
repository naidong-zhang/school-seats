class SchoolDivision < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :school_division_wards
  has_many :wards, through: :school_division_wards
end
