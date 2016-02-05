class Employee < ActiveRecord::Base
  has_many :shifts
end
