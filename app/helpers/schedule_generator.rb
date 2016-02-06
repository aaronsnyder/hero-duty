require 'singleton'

class ScheduleGenerator
  include Singleton

  def reGenerateSchedule()
    todays_date = Date.today
    
    # grab the suggested order from yaml config file
    suggested_order = Settings.predefined_shift_order
    
    # remove current schedules
    Shift.destroy_all
    
    employee_counter = 0
    (0..Settings.days_to_schedule).each do |i|
      date = todays_date + i
      
      if Settings.skip_weekends and (date.saturday? or date.sunday?)
        next
      end
      
      if Settings.skip_holidays and Holidays.on(date, :us).length > 0
        next
      end
      
      employee = Employee.find_by first_name: suggested_order[employee_counter]
      if !employee
        # we didn't find this employee...moving on!        
        next
      end
      
      # create new schedules   
      if !employee.work_restrictions.find_by date: date
        # No work restrictions, today!
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
end