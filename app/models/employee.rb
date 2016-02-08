class Employee < ActiveRecord::Base
  has_many :shifts
  has_many :work_restrictions
  
  attr_accessor :password
  before_save :encrypt_password

  validates_presence_of :first_name, :password, :on => :create
  validates_uniqueness_of :first_name, :on => :create
  
  def self.authenticate(first_name, password)
    employee = Employee.find_by first_name: first_name
    if employee && employee.password_hash == BCrypt::Engine.hash_secret(password, employee.password_salt)
      employee
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  private 
    def employee_params
      params.permit(:first_name, :password)
    end
end
