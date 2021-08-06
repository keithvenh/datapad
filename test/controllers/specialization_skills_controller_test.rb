require "test_helper"

class SpecializationSkillsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get specialization_skills_edit_url
    assert_response :success
  end
end
