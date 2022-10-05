require "application_system_test_case"

class HomeAddressesTest < ApplicationSystemTestCase
  setup do
    @home_address = home_addresses(:one)
  end

  test "visiting the index" do
    visit home_addresses_url
    assert_selector "h1", text: "Home addresses"
  end

  test "should create home address" do
    visit home_addresses_url
    click_on "New home address"

    fill_in "School division ward", with: @home_address.school_division_ward_id
    fill_in "Street name", with: @home_address.street_name
    fill_in "Street number", with: @home_address.street_number
    click_on "Create Home address"

    assert_text "Home address was successfully created"
    click_on "Back"
  end

  test "should update Home address" do
    visit home_address_url(@home_address)
    click_on "Edit this home address", match: :first

    fill_in "School division ward", with: @home_address.school_division_ward_id
    fill_in "Street name", with: @home_address.street_name
    fill_in "Street number", with: @home_address.street_number
    click_on "Update Home address"

    assert_text "Home address was successfully updated"
    click_on "Back"
  end

  test "should destroy Home address" do
    visit home_address_url(@home_address)
    click_on "Destroy this home address", match: :first

    assert_text "Home address was successfully destroyed"
  end
end
