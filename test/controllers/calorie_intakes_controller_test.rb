require 'test_helper'

class CalorieIntakesControllerTest < ActionDispatch::IntegrationTest
=begin コメントアウト
  setup do
    @calorie_intake = calorie_intakes(:one)
  end

  test "should get index" do
    get calorie_intakes_url
    assert_response :success
  end

  test "should get new" do
    get new_calorie_intake_url
    assert_response :success
  end

  test "should create calorie_intake" do
    assert_difference('CalorieIntake.count') do
      post calorie_intakes_url, params: { calorie_intake: {  } }
    end

    assert_redirected_to calorie_intake_url(CalorieIntake.last)
  end

  test "should show calorie_intake" do
    get calorie_intake_url(@calorie_intake)
    assert_response :success
  end

  test "should get edit" do
    get edit_calorie_intake_url(@calorie_intake)
    assert_response :success
  end

  test "should update calorie_intake" do
    patch calorie_intake_url(@calorie_intake), params: { calorie_intake: {  } }
    assert_redirected_to calorie_intake_url(@calorie_intake)
  end

  test "should destroy calorie_intake" do
    assert_difference('CalorieIntake.count', -1) do
      delete calorie_intake_url(@calorie_intake)
    end

    assert_redirected_to calorie_intakes_url
  end
=end
end
