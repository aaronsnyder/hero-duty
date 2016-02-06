class CreateShiftSwaps < ActiveRecord::Migration
  def change
    create_table :shift_swaps do |t|
      t.integer :original_shift_id
      t.integer :new_shift_id
      t.integer :requesting_employee_id
      t.integer :approving_employee_id
      t.boolean :approved

      t.timestamps
    end
  end
end
