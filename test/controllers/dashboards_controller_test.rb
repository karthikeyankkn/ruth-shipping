require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get show_user_dashboard" do
    get dashboards_show_user_dashboard_url
    assert_response :success
  end

end
