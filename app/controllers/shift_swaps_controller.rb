class ShiftSwapsController < ApplicationController
  def create
    original_shift = Shift.find(params[:original_shift_id])
    new_shift = Shift.find(params[:new_shift_id])
    
    if current_user.id == original_shift.employee_id and original_shift.on_call_date > Date.today and new_shift.on_call_date > Date.today
      ShiftSwap.create({
        original_shift_id: params[:original_shift_id],
        new_shift_id: params[:new_shift_id],
        requesting_employee_id: original_shift.employee_id,
        approving_employee_id: new_shift.employee_id
      })
    end
    
    redirect_to shifts_path
  end
  
  def approve
    swap = ShiftSwap.find(params[:id])
    
    if swap and current_user and current_user.id == swap.approving_employee_id
      swap.update({approved: true})
      original_shift = Shift.find(swap.original_shift_id)
      new_shift = Shift.find(swap.new_shift_id)
      original_shift.update({employee_id: swap.approving_employee_id})
      new_shift.update({employee_id: swap.requesting_employee_id})
    end
    
    redirect_to shifts_path
  end
  
  private
    def shift_swap_params
      params.permit(:id,:original_swap_id,:new_swap_id)
    end
end
