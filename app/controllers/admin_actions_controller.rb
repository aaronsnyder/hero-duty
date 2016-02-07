class AdminActionsController < ApplicationController
  def index
  end
  
  def regenerateSchedules
    ScheduleGenerator.instance.reGenerateSchedule
    redirect_to shifts_path
  end
end
