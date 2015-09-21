class AddColumnsToBusinesses < ActiveRecord::Migration
  def change
    add_column(:businesses, :image_url, :string)
    add_column(:businesses, :display_phone, :string)
    add_column(:businesses, :address1, :string)
    add_column(:businesses, :address2, :string)
    add_column(:businesses, :address3, :string)
    add_column(:businesses, :post_code, :string)
    add_column(:businesses, :latitude, :decimal)
    add_column(:businesses, :longitude, :decimal)
    add_column(:businesses, :categories, :string)
  end
end
