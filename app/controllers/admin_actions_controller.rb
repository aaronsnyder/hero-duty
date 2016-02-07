class AdminActionsController < ApplicationController
  def index
  end
  
  def regenerateSchedules
    ScheduleGenerator.instance.reGenerateSchedule
    redirect_to shifts_path, :notice => "Schedules re-generated for current month."
  end
  
  def generateSchedules
    first_shift_next_month = Shift.find_by on_call_date: Date.today.beginning_of_month.next_month
    last_shift_next_month = Shift.find_by on_call_date: Date.today.end_of_month.next_month
    
    # only generate new schedules for next month if you have to
    if first_shift_next_month.nil? or last_shift_next_month.nil?
      ScheduleGenerator.instance.generateSchedule
    else
      redirect_to shifts_path, :notice => "Schedules for next month already exist. No schedules generated."  
      return
    end
    redirect_to shifts_path, :notice => "New schedules have been generated for next month."
  end
end
