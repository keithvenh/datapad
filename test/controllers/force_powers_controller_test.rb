require "test_helper"

class ForcePowersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get force_powers_edit_url
    assert_response :success
  end

  test "should get show" do
    get force_powers_show_url
    assert_response :success
  end
end
