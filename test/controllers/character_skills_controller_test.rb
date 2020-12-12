require 'test_helper'

class CharacterSkillsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get character_skills_new_url
    assert_response :success
  end

  test "should get edit" do
    get character_skills_edit_url
    assert_response :success
  end

end
