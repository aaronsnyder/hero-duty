class CreateWorkRestrictions < ActiveRecord::Migration[4.2]
  def change
    create_table :work_restrictions do |t|
      t.belongs_to :employee, index:true
      t.date :date
      t.timestamps
    end
  end
end
