require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get jobs_show_url
    assert_response :success
  end

  test "should get new" do
    get jobs_new_url
    assert_response :success
  end
end
