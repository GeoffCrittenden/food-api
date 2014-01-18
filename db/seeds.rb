# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

orgs = Organization.create([ { name: 'Office Company, Inc.', org_type: 'customer' },
                             { name: 'Burrito Place Restaurant', org_type: 'restaurant' },
                             { name: 'Sandwich Hut', org_type: 'restaurant' },
                             { name: 'FoodApp, Inc.', org_type: 'application' } ])

users = User.create([ { username: 'worker@office.com', first_name: 'Lunch', last_name: 'Eater', user_type: 'customer', organization_id: 1, password: 'password', password_confirmation: 'password' },
                      { username: 'chef@burrito.com', first_name: 'Burrito', last_name: 'Maker', user_type: 'restaurant_admin', organization_id: 2, password: 'password', password_confirmation: 'password' },
                      { username: 'chef@sandwich.com', first_name: 'Sandwich', last_name: 'Maker', user_type: 'restaurant_admin', organization_id: 3, password: 'password', password_confirmation: 'password' },
                      { username: 'admin@foodapp.com', first_name: 'App', last_name: 'Admin', user_type: 'app_admin', organization_id: 4, password: 'password', password_confirmation: 'password' } ])

items = Item.create([ { name: 'Chicken Burrito', description: 'Our famous burrito filled with grilled chicken.', restaurant_id: 2 },
                      { name: 'Carne Asada Burrito', description: 'Our house specialty. Grilled steak, rice beans, and guacamole.', restaurant_id: 2 },
                      { name: 'Tres Tacos', description: 'Three soft shell tacos filled with your choice of ingredients.', restaurant_id: 2 },
                      { name: 'Turkey Sub', description: 'Freshly sliced turkey piled on a warm roll, topped with provolone, lettuce and tomato', restaurant_id: 3 },
                      { name: 'Meatball Sandwich', description: 'Meatballs marinated in our homestyle sauce, with melted mozarella on an Italian roll.', restaurant_id: 3 },
                      { name: 'BLTB', description: 'Bacon. Lettuce. Tomato. Bacon.', restaurant_id: 3 } ])

app = Application.create(name: 'FoodApp', admin_id: 4)
