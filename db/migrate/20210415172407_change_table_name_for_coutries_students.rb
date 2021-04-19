class ChangeTableNameForCoutriesStudents < ActiveRecord::Migration[6.0]
  def change
    rename_table :countries_students, :country_students
    add_column :country_students, :start_date, :date
    add_column :country_students, :end_date, :date  
  end
end
