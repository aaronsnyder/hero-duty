class SessionsController < ApplicationController
  def new
  end

  def create
    employee = Employee.authenticate(params[:first_name], params[:password])
    if employee
      session[:user_name] = employee.first_name
      redirect_to shifts_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid first name or password"
      render "new"
    end
  end

  def destroy
    session[:user_name] = nil
    redirect_to shifts_path, :notice => "Logged out!"
  end
end
