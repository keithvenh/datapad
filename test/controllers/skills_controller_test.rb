require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get skills_edit_url
    assert_response :success
  end
end
