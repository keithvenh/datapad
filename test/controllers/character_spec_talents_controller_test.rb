require 'test_helper'

class CharacterSpecTalentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get character_spec_talents_edit_url
    assert_response :success
  end

end
