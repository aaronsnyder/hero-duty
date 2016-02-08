class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :pending_shift_swaps

  private

    def current_user
      @current_user ||= Employee.find_by first_name: session[:user_name] if session[:user_name]
    end
  
    def pending_shift_swaps
      @pending_shift_swaps ||= ShiftSwap.includes(:new_shift,:original_shift,:original_shift => :employee).where("approving_employee_id = ? and approved IS NULL",current_user.id).find_all if current_user
    
      if @pending_shift_swaps and Settings.autoswap_shift_when_unavailable
        @pending_shift_swaps.each do |shift|
          ShiftSwapsHelper.approveShiftSwap(shift.id)
          redirect_to shifts_path, :notice => "#{shift.original_shift.employee.first_name} has swapped shifts with you. You will now work their #{shift.original_shift.on_call_date} shift, and they have taken your #{shift.new_shift.on_call_date} shift."        
        end
      else
        return @pending_shift_swaps
      end      
    end
end