require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get contents_edit_url
    assert_response :success
  end

  test "should get update" do
    get contents_update_url
    assert_response :success
  end

end
