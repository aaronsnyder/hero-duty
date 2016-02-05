require 'singleton'

class ScheduleGenerator
  include Singleton
  
  def reGenerateSchedule(*suggested_order)
    connection = ActiveRecord::Base.connection
    if suggested_order == nil
      suggested_order = ['Sherry', 'Boris', 'Vicente', 'Matte', 'Jack', 'Sherry','Matte', 'Kevin', 'Kevin', 'Vicente', 'Zoe', 'Kevin','Matte', 'Zoe', 'Jay', 'Boris', 'Eadon', 'Sherry','Franky', 'Sherry', 'Matte', 'Franky', 'Franky', 'Kevin','Boris', 'Franky', 'Vicente', 'Luis', 'Eadon', 'Boris','Kevin', 'Matte', 'Jay', 'James', 'Kevin', 'Sherry','Sherry', 'Jack', 'Sherry', 'Jack'
      ]
    end
    # remove current schedules
    Shift.destroy_all
    # get the suggested order
    
    # compare to unavailable days
    
    # create new schedules
    
  end
end