require 'test_helper'

class CookingStepsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cooking_steps_new_url
    assert_response :success
  end

  test "should get create" do
    get cooking_steps_create_url
    assert_response :success
  end

  test "should get edit" do
    get cooking_steps_edit_url
    assert_response :success
  end

  test "should get update" do
    get cooking_steps_update_url
    assert_response :success
  end

end
