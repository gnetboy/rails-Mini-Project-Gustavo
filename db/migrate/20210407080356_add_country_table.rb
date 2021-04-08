class AddCountryTable < ActiveRecord::Migration[6.0]
  def change
      create_table :countries do |t|
        t.string :name
        t.string :capital
        t.string :currency
        t.string :timezone
        t.timestamps
      end
  end
end
