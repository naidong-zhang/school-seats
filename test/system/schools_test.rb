require "application_system_test_case"

class SchoolsTest < ApplicationSystemTestCase
  setup do
    @school = schools(:one)
  end

  test "visiting the index" do
    visit schools_url
    assert_selector "h1", text: "Schools"
  end

  test "should create school" do
    visit schools_url
    click_on "New school"

    fill_in "Grade1", with: @school.grade1
    fill_in "Grade10", with: @school.grade10
    fill_in "Grade11", with: @school.grade11
    fill_in "Grade12", with: @school.grade12
    fill_in "Grade2", with: @school.grade2
    fill_in "Grade3", with: @school.grade3
    fill_in "Grade4", with: @school.grade4
    fill_in "Grade5", with: @school.grade5
    fill_in "Grade6", with: @school.grade6
    fill_in "Grade7", with: @school.grade7
    fill_in "Grade8", with: @school.grade8
    fill_in "Grade9", with: @school.grade9
    fill_in "Kindergarten", with: @school.kindergarten
    fill_in "Name", with: @school.name
    fill_in "Nursery", with: @school.nursery
    fill_in "School division ward", with: @school.school_division_ward_id
    click_on "Create School"

    assert_text "School was successfully created"
    click_on "Back"
  end

  test "should update School" do
    visit school_url(@school)
    click_on "Edit this school", match: :first

    fill_in "Grade1", with: @school.grade1
    fill_in "Grade10", with: @school.grade10
    fill_in "Grade11", with: @school.grade11
    fill_in "Grade12", with: @school.grade12
    fill_in "Grade2", with: @school.grade2
    fill_in "Grade3", with: @school.grade3
    fill_in "Grade4", with: @school.grade4
    fill_in "Grade5", with: @school.grade5
    fill_in "Grade6", with: @school.grade6
    fill_in "Grade7", with: @school.grade7
    fill_in "Grade8", with: @school.grade8
    fill_in "Grade9", with: @school.grade9
    fill_in "Kindergarten", with: @school.kindergarten
    fill_in "Name", with: @school.name
    fill_in "Nursery", with: @school.nursery
    fill_in "School division ward", with: @school.school_division_ward_id
    click_on "Update School"

    assert_text "School was successfully updated"
    click_on "Back"
  end

  test "should destroy School" do
    visit school_url(@school)
    click_on "Destroy this school", match: :first

    assert_text "School was successfully destroyed"
  end
end
