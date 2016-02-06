class AddPasswordsToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :password_hash, :password_salt
  end
end
