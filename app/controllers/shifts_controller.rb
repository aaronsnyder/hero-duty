class ShiftsController < ApplicationController
  def index
    @shifts = Shift.all    
    @shifts.each do |shift|
      if shift.on_call_date == Date.today
        @current_shift = shift
      end
    end
  end
  
  def show
    @shifts = Shift.includes(:employee).where(:employees => {:first_name => params[:first_name]})
    @hero = params[:first_name]
  end
  
  private
    def shift_params
      params.permit(:first_name)
    end
end
