class Shift < ActiveRecord::Base
  belongs_to :employee
  has_many :shift_swaps, -> { where "approved IS NULL" }, :foreign_key => "original_shift_id"
  
  validates_uniqueness_of :on_call_date, :on => :create
end
