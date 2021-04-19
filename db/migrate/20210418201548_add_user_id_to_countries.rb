class AddUserIdToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :user_id, :integer
    add_index :countries, :user_id
  end
end
