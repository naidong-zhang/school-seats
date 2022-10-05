class Ward < ApplicationRecord
  validates :name, presence: true

  has_many :school_division_wards
  has_many :school_divisions, through: :school_division_wards
end
