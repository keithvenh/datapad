require 'test_helper'

class CharacterTalentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get character_talents_new_url
    assert_response :success
  end

  test "should get edit" do
    get character_talents_edit_url
    assert_response :success
  end

  test "should get index" do
    get character_talents_index_url
    assert_response :success
  end

end
