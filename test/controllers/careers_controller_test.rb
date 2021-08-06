require "test_helper"

class CareersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get careers_edit_url
    assert_response :success
  end

  test "should get show" do
    get careers_show_url
    assert_response :success
  end
end
