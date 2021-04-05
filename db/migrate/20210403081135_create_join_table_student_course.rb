class CreateJoinTableStudentCourse < ActiveRecord::Migration[6.0]
  def change
    create_join_table :students, :courses do |t|
      t.index [:student_id, :course_id]
    
    end
  end
end
