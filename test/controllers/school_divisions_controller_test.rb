require "test_helper"

class SchoolDivisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_division = school_divisions(:one)
  end

  test "should get index" do
    get school_divisions_url
    assert_response :success
  end

  test "should get new" do
    get new_school_division_url
    assert_response :success
  end

  test "should create school_division" do
    assert_difference("SchoolDivision.count") do
      post school_divisions_url, params: { school_division: { name: @school_division.name } }
    end

    assert_redirected_to school_division_url(SchoolDivision.last)
  end

  test "should show school_division" do
    get school_division_url(@school_division)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_division_url(@school_division)
    assert_response :success
  end

  test "should update school_division" do
    patch school_division_url(@school_division), params: { school_division: { name: @school_division.name } }
    assert_redirected_to school_division_url(@school_division)
  end

  test "should destroy school_division" do
    assert_difference("SchoolDivision.count", -1) do
      delete school_division_url(@school_division)
    end

    assert_redirected_to school_divisions_url
  end
end
