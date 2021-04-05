class RemoveTableCoursesStudents < ActiveRecord::Migration[6.0]
  def change
    drop_join_table :students,:courses
  end
end
