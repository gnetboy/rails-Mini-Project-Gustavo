class AddFieldsToStudent < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :email, :string
    add_column :students, :phone, :string
  end
end
