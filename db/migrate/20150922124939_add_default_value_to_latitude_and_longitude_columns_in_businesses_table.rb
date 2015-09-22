class AddDefaultValueToLatitudeAndLongitudeColumnsInBusinessesTable < ActiveRecord::Migration
  def change
    change_column_default :businesses, :latitude, 51.508319
    change_column_default :businesses, :longitude, -0.128171
  end
end
