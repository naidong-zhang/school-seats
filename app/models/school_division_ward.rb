class SchoolDivisionWard < ApplicationRecord
  validates :name, presence: true

  belongs_to :school_division
  belongs_to :ward
end
