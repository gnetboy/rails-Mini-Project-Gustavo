class AddWeatherToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :weather, :string
  end
end
