require 'test_helper'

class AdminActionsControllerTest < ActionController::TestCase
  def setup
    @controller = AdminActionsController.new
  end
  
  test "should regenerate schedules" do
    get :regenerateSchedules
    assert_redirected_to shifts_path
  end
  
  test "should generate schedules" do
    get :generateSchedules
    assert_redirected_to shifts_path
  end
end
