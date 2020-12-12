require 'test_helper'

class CharacterCareersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get character_careers_new_url
    assert_response :success
  end

  test "should get edit" do
    get character_careers_edit_url
    assert_response :success
  end

end
