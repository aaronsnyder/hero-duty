require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  test "add new shift" do
    employee = Employee.first
    
    assert employee.shifts.create({on_call_date: Date.today})
  end
end
