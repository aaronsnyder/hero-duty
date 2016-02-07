class WorkRestrictionsController < ApplicationController
  def create
    employee = Employee.includes(:work_restrictions).find(params[:employee_id])
    if employee
      employee.work_restrictions.create({date: params[:date]})
      shift = Shift.find_by on_call_date: params[:date]
      if shift
        if Settings.autoswap_shift_when_unavailable
          redirect_to auto_shift_swap_path(shift.id)
        else
          redirect_to :back, notice: "You are now marked as unavailable for work on #{params[:date]}. Your fellow employees will be able to pick up your shift, and swap theirs to you."
        end   
      end
    end    
  end
  
  def destroy
    employee = Employee.includes(:work_restrictions).find(params[:employee_id])
    if employee
      employee.work_restrictions.find_by(date: params[:date]).delete
    end    
    redirect_to :back, notice: "You are no longer marked as unavailable for work on #{params[:date]}."
  end
end
