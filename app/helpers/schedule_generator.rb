require 'singleton'
require 'active_support'

class ScheduleGenerator
  include Singleton

  def reGenerateSchedule()
    start_of_month = Date.today.beginning_of_month
    end_of_month = Date.today.end_of_month
    
    # grab the suggested order from yaml config file
    suggested_order = Settings.predefined_shift_order
    
    # remove current schedules
    Shift.destroy_all
    
    employee_counter = 0
    (0..Settings.days_to_schedule).each do |i|
      date = start_of_month + i
      
      if date == end_of_month
        break
      end
      
      if Settings.skip_weekends and (date.saturday? or date.sunday?)
        next
      end
      
      if Settings.skip_holidays and Holidays.on(date, :us).length > 0
        next
      end
      
      available_employee_found = false
      try_counter = 0
      while !available_employee_found
        employee = Employee.find_by first_name: suggested_order[employee_counter]
        if !employee
          # we didn't find this employee...moving on!
          employee_counter += 1
          next
        end  
        if employee.work_restrictions.find_by date: date
          # swap the current employee with one [try_counter] down the array
          try_counter += 1
          if employee_counter + try_counter > suggested_order.length
            # we'd overflow the array, start back at 0
            proper_offset = employee_counter + try_counter - suggested_order.length - 1
          else
            proper_offset = employee_counter + try_counter
          end          
          suggested_order[employee_counter], suggested_order[proper_offset] = suggested_order[proper_offset], suggested_order[employee_counter]  
          next
        end  
        available_employee_found = true
      end      
      
      # create new schedules   
      employee.shifts.create({on_call_date: date})
      if employee_counter == suggested_order.length
        #start back at the beginning
        employee_counter = 0
      else
        employee_counter += 1
      end
    end  
  end
end