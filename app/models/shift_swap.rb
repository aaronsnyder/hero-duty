class ShiftSwap < ActiveRecord::Base
  belongs_to :original_shift, :class_name => "Shift", :foreign_key => "original_shift_id"
  belongs_to :new_shift, :class_name => "Shift", :foreign_key => "new_shift_id"
end
