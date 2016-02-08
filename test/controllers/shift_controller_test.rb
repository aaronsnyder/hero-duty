require 'test_helper'

class ShiftControllerTest < ActionController::TestCase
  def setup
    @controller = ShiftsController.new
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shifts)
  end
  
  test "should get show" do
    get(:show, {'first_name' => "Sherry"})
    assert_response :success
    assert_not_nil assigns(:shifts)
  end
end
