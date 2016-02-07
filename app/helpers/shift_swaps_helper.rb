module ShiftSwapsHelper
  def self.createShiftSwap(original_shift_id,new_shift_id)
    original_shift = Shift.find(original_shift_id)
    new_shift = Shift.find(new_shift_id)
    
    swap = ShiftSwap.create({
      original_shift_id: original_shift_id,
      new_shift_id: new_shift_id,
      requesting_employee_id: original_shift.employee_id,
      approving_employee_id: new_shift.employee_id
    })
    return swap.id
  end
  
  def self.approveShiftSwap(id)
    swap = ShiftSwap.find(id)
    
    swap.update({approved: true})
    original_shift = Shift.find(swap.original_shift_id)
    new_shift = Shift.find(swap.new_shift_id)
    original_shift.update({employee_id: swap.approving_employee_id})
    new_shift.update({employee_id: swap.requesting_employee_id})
  end

  def createShiftSwap(original_shift_id,new_shift_id)
    ShiftSwapsHelper.createShiftSwap(original_shift_id,new_shift_id)
  end
  
  def approveShiftSwap(id)
    ShiftSwapsHelper.approveShiftSwap(id)
  end
end
