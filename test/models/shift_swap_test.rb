require 'test_helper'

class ShiftSwapTest < ActiveSupport::TestCase
  test "add new shift swap" do
    employee1 = Employee.first
    employee2 = Employee.last
    shift1 = employee1.shifts.create({on_call_date: Date.today})
    shift2 = employee2.shifts.create({on_call_date: Date.today + 1.day})
    
    assert ShiftSwap.create({
      original_shift_id:shift1.id, 
      new_shift_id:shift2.id, 
      requesting_employee_id:employee1.id, 
      approving_employee_id:employee2.id
    })
  end
end
