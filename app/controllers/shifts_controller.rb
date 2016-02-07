class ShiftsController < ApplicationController
  def index
    if Settings.hide_previous_days
      @shifts = Shift.where("on_call_date >= ?", Date.today)
    else
      @shifts = Shift.all  
    end
      
    @shifts.each do |shift|
      if shift.on_call_date == Date.today
        @current_shift = shift
      end
    end
  end
  
  def show
    if Settings.hide_previous_days
      @shifts = Shift.includes(:employee).where("on_call_date >= ?", Date.today).where(:employees => {:first_name => params[:first_name]})
    else
      @shifts = Shift.includes(:employee).where(:employees => {:first_name => params[:first_name]})
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
