class RenameTableCountryStudents < ActiveRecord::Migration[6.0]
  def change
    rename_table :country_students, :country_users
    rename_column :country_users, :student_id, :user_id
  end
end
