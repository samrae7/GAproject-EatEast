class AddBusinessIdToReviews < ActiveRecord::Migration
  def change
    
    add_reference :reviews, :business, index: true, foreign_key: true
  end
end
