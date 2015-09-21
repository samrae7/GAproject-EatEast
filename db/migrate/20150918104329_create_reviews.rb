class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :notes
      t.integer :food_rating
      t.integer :service_rating
      t.integer :value_rating

      t.timestamps null: false
    end
  end
end
