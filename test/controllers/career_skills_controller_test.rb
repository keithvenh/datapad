require "test_helper"

class CareerSkillsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get career_skills_edit_url
    assert_response :success
  end
end
