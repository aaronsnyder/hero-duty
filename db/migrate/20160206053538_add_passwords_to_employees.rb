class AddPasswordsToEmployees < ActiveRecord::Migration[4.2]
  def change
    add_column :employees, :password_hash, :password_salt
  end
end
