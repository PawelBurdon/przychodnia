require 'test_helper'

class VievsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vievs_index_url
    assert_response :success
  end

end
