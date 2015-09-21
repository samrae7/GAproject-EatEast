class AddBusinessIdToLikesTable < ActiveRecord::Migration
  def change

    add_reference :likes, :business, index: true, foreign_key: true
  end
end
