class Shift < ActiveRecord::Base
  belongs_to :employee
  
  validates_uniqueness_of :on_call_date, :on => :create
end
