##food-api

#####an API for retrieving user food info
#####*Built on Ruby v2.0.0 & Rails v4.0.2*

===

####System dependencies:

  PostgreSQL for ActiveRecord Database

  BCrypt-Ruby for secure passwords

  JSON for JSON output formatting
  
  Nokogiri for XML output formatting
  
===
####To Install:

  ``$ git clone https://github.com/GeoffCrittenden/food-api``
  
  ``$ gem install pg`` if needed 
  
  If further PostgreSQL setup is necessary, please go to http://www.postgresql.org for help.
  
  ``$ gem install bcrypt-ruby`` if needed
  
  ``$ gem install nokogiri`` if needed
  
  ``$ bundle install``
  
####To Run:

  ``rails server`` or ``rails s``
  
  and then navigate to ``http://localhost:3000`` in the browser or ``$ curl "http://localhost:3000"``
  
===

####Database Setup:

  ``$ rake db:create`` and ``$ rake db:migrate`` will set up the realtional tables.

  ``$ rake db:seed`` will seed the development database with a few samples.

####Running the Test Suite:

  Make sure to run ``$ bin/rake db:migrate RAILS_ENV=test`` first to set up the test environment database.
  
  As .rspec is a part of the .gitignore, I suggest creating a .rspec file in the root directory, with the ``--format documentation --color`` optional arguments so that you get full documentation and color when running the RSpec test suite.
  
  Then run ``$ bundle exec rspec`` or ``$ bundle exec rspec -f d -c`` if you did not set up a .rspec file.

===

