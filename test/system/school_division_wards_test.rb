require "application_system_test_case"

class SchoolDivisionWardsTest < ApplicationSystemTestCase
  setup do
    @school_division_ward = school_division_wards(:one)
  end

  test "visiting the index" do
    visit school_division_wards_url
    assert_selector "h1", text: "School division wards"
  end

  test "should create school division ward" do
    visit school_division_wards_url
    click_on "New school division ward"

    fill_in "Name", with: @school_division_ward.name
    fill_in "School division", with: @school_division_ward.school_division_id
    fill_in "Ward", with: @school_division_ward.ward_id
    click_on "Create School division ward"

    assert_text "School division ward was successfully created"
    click_on "Back"
  end

  test "should update School division ward" do
    visit school_division_ward_url(@school_division_ward)
    click_on "Edit this school division ward", match: :first

    fill_in "Name", with: @school_division_ward.name
    fill_in "School division", with: @school_division_ward.school_division_id
    fill_in "Ward", with: @school_division_ward.ward_id
    click_on "Update School division ward"

    assert_text "School division ward was successfully updated"
    click_on "Back"
  end

  test "should destroy School division ward" do
    visit school_division_ward_url(@school_division_ward)
    click_on "Destroy this school division ward", match: :first

    assert_text "School division ward was successfully destroyed"
  end
end
