class WorkRestrictionsController < ApplicationController
  def create
    employee = Employee.includes(:work_restrictions).find(params[:employee_id])
    if employee
      employee.work_restrictions.create({date: params[:date]})
    end    
    redirect_to :back
  end
  
  def destroy
    employee = Employee.includes(:work_restrictions).find(params[:employee_id])
    if employee
      employee.work_restrictions.find_by(date: params[:date]).delete
    end    
    redirect_to :back
  end
end
