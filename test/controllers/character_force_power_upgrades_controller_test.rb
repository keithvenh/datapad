require "test_helper"

class CharacterForcePowerUpgradesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get character_force_power_upgrades_edit_url
    assert_response :success
  end

  test "should get update" do
    get character_force_power_upgrades_update_url
    assert_response :success
  end
end
