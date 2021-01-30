require 'test_helper'

class CharacterSpecializationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get character_specializations_new_url
    assert_response :success
  end

  test "should get edit" do
    get character_specializations_edit_url
    assert_response :success
  end

end
