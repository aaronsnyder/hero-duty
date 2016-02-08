require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  test "employees must have passwords" do
    employee = Employee.new
    employee.first_name = 'Mario'
    
    assert_not employee.save
  end

  test "employees must have first_names" do
    employee = Employee.new
    employee.password = 'myNewPassword'
    
    assert_not employee.save
  end
  
  test "employees must have unique names" do
    employee1 = Employee.create({first_name: 'Mario',password: 'Mario1'})
    employee2 = Employee.new({first_name: 'Mario',password: 'Mario2'})
    assert_not employee2.save
  end
  
  test "employees' passwords must not be in plain text" do
    employee = Employee.create({first_name: 'Luigi',password: 'Luigi'})
    
    assert_not employee.password_hash == 'Luigi'
  end
end
