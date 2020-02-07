class CreateShifts < ActiveRecord::Migration[4.2]
  def change
    create_table :shifts do |t|
      t.belongs_to :employee, index:true
      t.date :on_call_date
      t.timestamps
    end
  end
end
