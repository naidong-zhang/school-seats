require "test_helper"

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school = schools(:one)
  end

  test "should get index" do
    get schools_url
    assert_response :success
  end

  test "should get new" do
    get new_school_url
    assert_response :success
  end

  test "should create school" do
    assert_difference("School.count") do
      post schools_url, params: { school: { grade1: @school.grade1, grade10: @school.grade10, grade11: @school.grade11, grade12: @school.grade12, grade2: @school.grade2, grade3: @school.grade3, grade4: @school.grade4, grade5: @school.grade5, grade6: @school.grade6, grade7: @school.grade7, grade8: @school.grade8, grade9: @school.grade9, kindergarten: @school.kindergarten, name: @school.name, nursery: @school.nursery, school_division_ward_id: @school.school_division_ward_id } }
    end

    assert_redirected_to school_url(School.last)
  end

  test "should show school" do
    get school_url(@school)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_url(@school)
    assert_response :success
  end

  test "should update school" do
    patch school_url(@school), params: { school: { grade1: @school.grade1, grade10: @school.grade10, grade11: @school.grade11, grade12: @school.grade12, grade2: @school.grade2, grade3: @school.grade3, grade4: @school.grade4, grade5: @school.grade5, grade6: @school.grade6, grade7: @school.grade7, grade8: @school.grade8, grade9: @school.grade9, kindergarten: @school.kindergarten, name: @school.name, nursery: @school.nursery, school_division_ward_id: @school.school_division_ward_id } }
    assert_redirected_to school_url(@school)
  end

  test "should destroy school" do
    assert_difference("School.count", -1) do
      delete school_url(@school)
    end

    assert_redirected_to schools_url
  end
end
