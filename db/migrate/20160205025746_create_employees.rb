class CreateEmployees < ActiveRecord::Migration[4.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.timestamps
    end
  end
end
