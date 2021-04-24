class CreateJoinTableCountryStudent < ActiveRecord::Migration[6.0]
  def change
    create_table :countries_students do |t|
      t.references :country
      t.references :student
    end
  end
end
