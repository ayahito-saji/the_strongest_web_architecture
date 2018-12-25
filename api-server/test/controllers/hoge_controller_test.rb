require 'test_helper'

class HogeControllerTest < ActionDispatch::IntegrationTest
  test "should get fuga" do
    get hoge_fuga_url
    assert_response :success
  end

end
