#EatEast

An app to help people who live, work or study in East London find a delicious and good value lunch

##Basic functionality

* Browse restaurants, pubs, bars and cafes and view details, based on preferences
* Review an establishment
* Edit/Update entries

##User journey:

See wireframes

##Learning aims

* To do at least 50 git commits
* Use TDD - use some unit testing and a lot of feature testing
* Use AJAX to do in-page data requests
* Use a framework for styling eg Bootstrap or Foundation
* Use faker to create some dummy seed data
* CSS frameworks - Foundation
* Use google maps API to get maps

##Further functionality:

* Search by keyword
* Include google maps in the listings pages
* Upload your own photos of food

##Key decisions made during production
1 I decided to take data from yelp and put into my database rather than using the API to make real-time requests because I want my users to be able to upload their own ratings and review and at present the API does not allow for posting of data.


2 At first I had a users model which I took out because I realised that nested routes eg, '/users/user_id/businesses/business_id' wouldn't be the way that sites would work out whic user you were in practice, so I changed it to three models (business, review, like) where there is only one user.

##Table columns

###Business
*   name
* snippet_text
* city
* image_url
* display_phone
* address1
* address2
* address3
* post_code
* latitude
* longitude
* categories
* yelp_id
* veg_friendly
* cuisine
* drinks
* coffee
* food
* takeaway

###Like

* business_id

###Review
* business_id
* notes
* food_rating
* value_rating
* service_rating

##Problems

* I tried to make a single-page app using AJAX requests to get data on the page. I ended up with lots of ..js.erb files in my views folder and a confusing set of actions. This should be rewritten, first as html pages and then as ajax using .ajax or $.get and with all the JS in one file in the assets folder. This is why the edit and like buttons do not take the user to a view that shows their updated info ( you have to refesh).

The single app is also annoyiong because it breaks the back button. It's also unecessry the way I have it designed currently because there's no information that needs to be dynmaically added to a page (ie you could just go to another page).

Functionality still to do

1. Fix the above - start again and create new controller actions for Business model.
2. Allow user to add a review and ratings
3. Put average ratings on the page dynamically ( write methods in the review model)
4. Add restaurant website to show page
5. Allow user to add image_url, website and latitude and longitude when adding a listing.
5. Allow upload of images
6. Get lat and long from entered postcode



##Sample data (for presentation)

Nandos
Commercial Street
London
E1 6NF
020 7650 7775





