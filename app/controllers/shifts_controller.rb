class ShiftsController < ApplicationController
  def index
    if Settings.hide_previous_days
      @shifts = Shift.where("on_call_date > ?", Date.today).where("on_call_date <= ?", Date.today + 1.month)
    else
      @shifts = Shift.all.limit(31)
    end

    @current_shift = Shift.find_by on_call_date: Date.today
    
    if @shifts.last.on_call_date < (Date.today + 3.weeks)
      # we're running out of shifts! regenerate...
      ScheduleGenerator.instance.reGenerateSchedule
    end
  end
  
  def show
    if Settings.hide_previous_days
      @shifts = Shift.includes(:employee).where("on_call_date >= ?", Date.today).where("on_call_date <= ?", Date.today + 1.month).where(:employees => {:first_name => params[:first_name]})
    else
      @shifts = Shift.includes(:employee).where(:employees => {:first_name => params[:first_name]}).limit(31)
    end
    
    @hero = params[:first_name]
  end
  
  def pickup
    shift = Shift.find(params[:id])
    if shift
      shift.update({employee_id: current_user.id})
    end
    redirect_to shifts_path
  end
  
  private
    def shift_params
      params.permit(:first_name,:id)
    end
end
