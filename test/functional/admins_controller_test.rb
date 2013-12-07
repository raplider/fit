require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should get deanery_editor" do
    get :deanery_editor
    assert_response :success
  end

  test "should get static_pages_editor" do
    get :static_pages_editor
    assert_response :success
  end

end
