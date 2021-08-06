require "test_helper"

class SpecializationsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get specializations_edit_url
    assert_response :success
  end

  test "should get show" do
    get specializations_show_url
    assert_response :success
  end
end
