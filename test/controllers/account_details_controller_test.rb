require "test_helper"

class AccountDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get account_details_show_url
    assert_response :success
  end
end
