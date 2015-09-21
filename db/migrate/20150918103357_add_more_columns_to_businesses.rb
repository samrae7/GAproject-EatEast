class AddMoreColumnsToBusinesses < ActiveRecord::Migration
  def change
        add_column(:businesses, :veg_friendly, :boolean)
        add_column(:businesses, :cuisine, :string)
        add_column(:businesses, :drinks, :boolean)
        add_column(:businesses, :coffee, :boolean)
        add_column(:businesses, :food, :boolean)
        add_column(:businesses, :takeaway, :boolean)
        add_column(:businesses, :delivers, :boolean)
  end

end
