require 'test_helper'

class ClassroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get classrooms_index_url
    assert_response :success
  end

  test "should get show" do
    get classrooms_show_url
    assert_response :success
  end

end
