require 'singleton'

class ScheduleGenerator
  include Singleton

  def reGenerateSchedule(days_to_schedule=30,suggested_order=[],skip_weekends=false,skip_holidays=false)
    db_connection = ActiveRecord::Base.connection
    todays_date = Date.today
    
    # TODO: 
    # make this work by days_to_schedle, instead of just iterating suggested order
    # make the suggested_order array the same length as the days_to_schedule
    # as an alternative, just pull distinct names out of the DB, and use that to build the array
    # account for weekends
    # account for holidays
    # remove the BS array from this file...
    
    if suggested_order.length == 0
      suggested_order = ['Sherry', 'Boris', 'Vicente', 'Matte', 'Jack', 'Sherry','Matte', 'Kevin', 'Kevin', 'Vicente', 'Zoe', 'Kevin','Matte', 'Zoe', 'Jay', 'Boris', 'Eadon', 'Sherry','Franky', 'Sherry', 'Matte', 'Franky', 'Franky', 'Kevin','Boris', 'Franky', 'Vicente', 'Luis', 'Eadon', 'Boris','Kevin', 'Matte', 'Jay', 'James', 'Kevin', 'Sherry','Sherry', 'Jack', 'Sherry', 'Jack'
      ]
    end
    
    # remove current schedules
    Shift.destroy_all
    
    suggested_order.each_with_index do |name,i|
      date = todays_date+i
      employee = Employee.find_by first_name: name
      
      if !employee
        # we didn't find this employee...moving on!
        continue
      end
      
      if !employee.work_restrictions.find_by date: date
        # No work restrictions, today!
        employee.shifts.create({on_call_date: Date.today})
      end
    end
    # create new schedules    
  end
end