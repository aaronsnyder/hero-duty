class ShiftsController < ApplicationController
  def index
    # including :employee to remove n+1 possibility...
    @shifts = Shift.includes(:employee,:employee => :work_restrictions).where("on_call_date > ?", Date.today).where("on_call_date <= ?", Date.today + 1.month)
    @current_shift = Shift.find_by on_call_date: Date.today
    
    if @shifts.last.on_call_date < Date.today.beginning_of_month.next_month
      # we're running out of shifts! generate more...
      ScheduleGenerator.instance.generateSchedule
    end
  end
  
  def show    
    # including :employee to remove n+1 possibility...
    @shifts = Shift.includes(:employee,:employee => :work_restrictions).where("on_call_date >= ?", Date.today).where("on_call_date <= ?", Date.today + 1.month).where(:employees => {:first_name => params[:first_name]})
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
