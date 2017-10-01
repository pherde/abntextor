require 'test_helper'

class BuildControllerTest < ActionDispatch::IntegrationTest
  test "should get build" do
    get build_build_url
    assert_response :success
  end

end
