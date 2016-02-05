class CreateWorkRestrictions < ActiveRecord::Migration
  def change
    create_table :work_restrictions do |t|
      t.belongs_to :employee, index:true
      t.date :date
      t.timestamps
    end
  end
end
