class Employee < ActiveRecord::Base
  has_many :shifts
  has_many :work_restrictions
end
