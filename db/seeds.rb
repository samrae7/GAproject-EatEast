# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Review.delete_all
Like.delete_all
Business.delete_all

def get_restaurants restaurantsJSON

  restaurantsRuby = JSON.parse(restaurantsJSON)['businesses'].map {|business| business.keep_if{|key, value| ['name','display_phone','snippet_text', 'image_url', 'location', 'categories', 'id'].include?(key)} }


  restaurantsRuby.map do |restaurant|
    
    restaurant['yelp_id'] = restaurant.delete('id')

    # possible_cusines = ['Chinese, dim sum, asian fusion', '']

    extraData = {

      'address1' => restaurant['location']['address'][0].to_s,
      'address2' => restaurant['location']['address'][1].to_s,
      'address3' => restaurant['location']['address'][2].to_s,
      'city' => restaurant['location']['city'],
      'post_code' => restaurant['location']['postal_code'],
      'latitude' => restaurant['location']['coordinate']['latitude'],
      'longitude' => restaurant['location']['coordinate']['longitude'],

      'categories' => restaurant['categories'].flatten.to_s.delete('\[]\"'),
      'takeaway' => true,
      'delivers' => false,
      'veg_friendly'=> true

    }

    restaurant.delete('location')
    restaurant.delete('categories')
    
    restaurant.merge!(extraData)

  end

end

restaurants_brick_lane = Yelp.client.search('Brick Lane London', { term: 'food' }).to_json

restaurants_whitechapel = Yelp.client.search('whitechapel London', { term: 'food' }).to_json

restaurants_spitalfields = Yelp.client.search('spitalfields London', { term: 'food' }).to_json

restaurants_liverpool_street = Yelp.client.search('liverpool street London', { term: 'food' }).to_json


brick_lane_array = get_restaurants restaurants_brick_lane
whitechapel_array = get_restaurants restaurants_whitechapel
spitalfields_array = get_restaurants restaurants_spitalfields
liverpool_street_array = get_restaurants restaurants_liverpool_street

all_restaurants = (brick_lane_array + whitechapel_array + spitalfields_array + liverpool_street_array).uniq!

all_restaurants.each do |restaurant| 
  Business.create(restaurant)
  # place.reviews.create(notes:'Espresso, cream macchiato affogato, mocha that cup aftertaste pumpkin spice variety french press. Trifecta, chicory, wings french press, skinny galão, medium dripper coffee aged café au lait.')
end

Business.all.each do |business|

  business.reviews.create(notes: '"Espresso, cream macchiato affogato, mocha that cup aftertaste pumpkin spice variety french press. Trifecta, chicory, wings french press, skinny galo, medium dripper coffee aged caf au lait."')

  business.reviews.create(notes: '"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eu justo quam. Sed metus justo, luctus in gravida sed, consequat sit amet turpis. Aenean vitae vulputate libero, et placerat tortor."')
end



