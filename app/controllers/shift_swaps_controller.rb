class ShiftSwapsController < ApplicationController
  def create
    original_shift = Shift.find(params[:original_shift_id])
    new_shift = Shift.find(params[:new_shift_id])
    
    if current_user.id == original_shift.employee_id and original_shift.on_call_date > Date.today and new_shift.on_call_date > Date.today
      ShiftSwapsHelper.createShiftSwap(original_shift.id,new_shift.id)
    end
    redirect_to shifts_path, :notice => "Shift swap requested and pending. Waiting on #{new_shift.employee.first_name} for approval."
  end
  
  def approve
    if current_user and current_user.id == swap.approving_employee_id
      ShiftSwapsHelper.approveShiftSwap(params[:id])
      redirect_to shifts_path, :notice => "Shift swap complete."
      return
    else
      redirect_to shifts_path, :notice => "Unable to swap shifts. Please contact the employee you're swapping with."
      return
    end
  end
  
  def autoSwap
    if Settings.autoswap_shift_when_unavailable
      current_shift = Shift.includes(:employee,:employee => :work_restrictions).find(params[:id])
      current_work_restriction_dates = current_shift.employee.work_restrictions.map {|x| x.date}
      
      replacement_not_found = true
      max_date_checked = current_shift.on_call_date
      while replacement_not_found
        
        # get the next shift current employee is available for
        potential_new_shift = Shift.includes(:employee,:employee => :work_restrictions).where("on_call_date > ? AND on_call_date NOT IN (?) AND employee_id != ?",max_date_checked,current_work_restriction_dates,current_shift.employee_id).limit(1).take()
          
        max_date_checked = potential_new_shift.on_call_date
        # then, see if it's employee would be available for *this* shift
        if !potential_new_shift.employee.work_restrictions.map {|x| x.date}.include? current_shift.on_call_date
          # hooray!
          replacement_not_found = false
          # swap the shifts
          ShiftSwapsHelper.createShiftSwap(current_shift.id,potential_new_shift.id)
          redirect_to shifts_path, :notice => "Shift swap requested! Once acknowledged by #{potential_new_shift.employee.first_name}, you're new hero duty will be on #{potential_new_shift.on_call_date}."
          return
        end
        
        # create a bail-out condition, in case the state of the data is super wacky
        if max_date_checked > Date.today + 60.days
          redirect_to shifts_path, :alert => "Could not auto-reschedule shift. Please work with your fellow employees to arrange a swap."
          return
        end
      end
    end
  end
  
  private
    def shift_swap_params
      params.permit(:id,:original_swap_id,:new_swap_id)
    end
end
