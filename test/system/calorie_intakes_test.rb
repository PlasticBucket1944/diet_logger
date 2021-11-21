require "application_system_test_case"

class CalorieIntakesTest < ApplicationSystemTestCase
  setup do
    @calorie_intake = calorie_intakes(:one)
  end

  test "visiting the index" do
    visit calorie_intakes_url
    assert_selector "h1", text: "Calorie Intakes"
  end

  test "creating a Calorie intake" do
    visit calorie_intakes_url
    click_on "New Calorie Intake"

    click_on "Create Calorie intake"

    assert_text "Calorie intake was successfully created"
    click_on "Back"
  end

  test "updating a Calorie intake" do
    visit calorie_intakes_url
    click_on "Edit", match: :first

    click_on "Update Calorie intake"

    assert_text "Calorie intake was successfully updated"
    click_on "Back"
  end

  test "destroying a Calorie intake" do
    visit calorie_intakes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Calorie intake was successfully destroyed"
  end
end
