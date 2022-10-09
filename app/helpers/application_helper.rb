module ApplicationHelper
  def retrieve_select_options
    @school_division_wards = SchoolDivisionWard.all
  end
end
