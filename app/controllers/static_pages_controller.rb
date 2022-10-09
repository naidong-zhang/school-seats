NUM = 50

class StaticPagesController < ApplicationController
  def about; end

  def home
    @num = NUM

    @wards_count = Ward.count
    @has_too_many_wards = @wards_count > NUM
    @wards = @has_too_many_wards ? Ward.limit(NUM) : Ward.all

    @school_divisions_count = SchoolDivision.count
    @has_too_many_school_divisions = @school_divisions_count > NUM
    @school_divisions = @has_too_many_school_divisions ? SchoolDivision.limit(NUM) : SchoolDivision.all

    @school_division_wards_count = SchoolDivisionWard.count
    @has_too_many_school_division_wards = @school_division_wards_count > NUM
    @school_division_wards = @has_too_many_school_division_wards ? SchoolDivisionWard.limit(NUM) : SchoolDivisionWard.all

    @schools_count = School.count
    @has_too_many_schools = @schools_count > NUM
    @schools = @has_too_many_schools ? School.limit(NUM) : School.all

    @home_addresses_count = HomeAddress.count
    @has_too_many_home_addresses = @home_addresses_count > NUM
    @home_addresses = @has_too_many_home_addresses ? HomeAddress.limit(NUM) : HomeAddress.all
  end
end
