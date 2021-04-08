class CreateJoinTableCountryStudent < ActiveRecord::Migration[6.0]
  def change
    create_join_table :countries, :students do |t|
      # t.index [:country_id, :student_id]
      # t.index [:student_id, :country_id]
    end
  end
end
