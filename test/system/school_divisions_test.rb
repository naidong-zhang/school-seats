require "application_system_test_case"

class SchoolDivisionsTest < ApplicationSystemTestCase
  setup do
    @school_division = school_divisions(:one)
  end

  test "visiting the index" do
    visit school_divisions_url
    assert_selector "h1", text: "School divisions"
  end

  test "should create school division" do
    visit school_divisions_url
    click_on "New school division"

    fill_in "Name", with: @school_division.name
    click_on "Create School division"

    assert_text "School division was successfully created"
    click_on "Back"
  end

  test "should update School division" do
    visit school_division_url(@school_division)
    click_on "Edit this school division", match: :first

    fill_in "Name", with: @school_division.name
    click_on "Update School division"

    assert_text "School division was successfully updated"
    click_on "Back"
  end

  test "should destroy School division" do
    visit school_division_url(@school_division)
    click_on "Destroy this school division", match: :first

    assert_text "School division was successfully destroyed"
  end
end
