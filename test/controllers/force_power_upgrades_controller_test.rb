require "test_helper"

class ForcePowerUpgradesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get force_power_upgrades_edit_url
    assert_response :success
  end
end
