require 'test_helper'

class WorkRestrictionTest < ActiveSupport::TestCase  
  test "add new work restriction" do
    employee = Employee.first
    
    assert employee.work_restrictions.create({date: Date.today})
  end
end