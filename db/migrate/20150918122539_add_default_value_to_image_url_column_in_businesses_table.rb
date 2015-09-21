class AddDefaultValueToImageUrlColumnInBusinessesTable < ActiveRecord::Migration
  def change
    change_column_default :businesses, :image_url, 'http://lorempixel.com/output/abstract-q-c-500-350-5.jpg'
  end
end
