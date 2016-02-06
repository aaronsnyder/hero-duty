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
    @pending_shift_swaps ||= ShiftSwap.where(approving_employee_id: current_user.id).where(approved: nil).find_each if current_user
  end
end
