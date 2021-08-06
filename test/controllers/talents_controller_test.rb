require "test_helper"

class TalentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get talents_edit_url
    assert_response :success
  end
end
