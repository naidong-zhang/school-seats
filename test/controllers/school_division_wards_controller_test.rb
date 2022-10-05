require "test_helper"

class SchoolDivisionWardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_division_ward = school_division_wards(:one)
  end

  test "should get index" do
    get school_division_wards_url
    assert_response :success
  end

  test "should get new" do
    get new_school_division_ward_url
    assert_response :success
  end

  test "should create school_division_ward" do
    assert_difference("SchoolDivisionWard.count") do
      post school_division_wards_url, params: { school_division_ward: { name: @school_division_ward.name, school_division_id: @school_division_ward.school_division_id, ward_id: @school_division_ward.ward_id } }
    end

    assert_redirected_to school_division_ward_url(SchoolDivisionWard.last)
  end

  test "should show school_division_ward" do
    get school_division_ward_url(@school_division_ward)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_division_ward_url(@school_division_ward)
    assert_response :success
  end

  test "should update school_division_ward" do
    patch school_division_ward_url(@school_division_ward), params: { school_division_ward: { name: @school_division_ward.name, school_division_id: @school_division_ward.school_division_id, ward_id: @school_division_ward.ward_id } }
    assert_redirected_to school_division_ward_url(@school_division_ward)
  end

  test "should destroy school_division_ward" do
    assert_difference("SchoolDivisionWard.count", -1) do
      delete school_division_ward_url(@school_division_ward)
    end

    assert_redirected_to school_division_wards_url
  end
end
