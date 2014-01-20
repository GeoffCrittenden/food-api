##food-api

####an API for retrieving user food info
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

  ``$ rails server`` or ``$ rails s``
  
  and then navigate to ``http://localhost:3000`` in the browser or ``$ curl "http://localhost:3000"`` for further documentation and to see sample code.
  
===

####Database Setup:

  ``$ rake db:create`` and ``$ rake db:migrate`` will set up the realtional tables.

  ``$ rake db:seed`` will seed the development database with a few samples.
  
  You can also run `$ rails console` or `$ rails c` to launch the console which will allow for further throubleshooting, if needed.

####Running the Test Suite:

  Make sure to run ``$ bin/rake db:migrate RAILS_ENV=test`` first to set up the test environment database.
  
  As .rspec is a part of the .gitignore, I suggest creating a .rspec file in the root directory, with the ``--format documentation --color`` optional arguments so that you get full documentation and color when running the RSpec test suite.
  
  Then run ``$ bundle exec rspec`` or ``$ bundle exec rspec -f d -c`` if you did not set up a .rspec file.

===

####Issues:

######1) BCrypt Password Validations:
  
  At this time, adding ActiveRecord password validations to the User model breaks the model's ability to save to the database.  So right now there are no validations for password length or password confirmation.
  
######2) Testing:
  
  There are only about 30 rspec examples written at this time, and these are only on the models.  There is no integration testing yet with the controller.
  
######3) Refactoring:
  
  The application is currently in an MVP (Minimum Viable Product) state.  Much of the codebase needs to be rewritten to clean up repetitive code and for appearance.
  
######4) Output Formatting:

  This applcation is designed to output either JSON or XML data.  When outputting to either a web browser or to a command shell, it is not very pretty.  A way to present it in a more appealing manner that does not break the integrity of the data needs to be figured out.
  
===

##Contact

If you have any comments or suggestions, please feel free to contact me at [geoffcritt at gmail.com](mailto:geoffcritt@gmail.com) or on Twitter at [@GeoffCrittenden](http://twitter.com/GeoffCrittenden).

Let me know if you discover more issues, as I know there are more to be found.  Submit all pull requests through GitHub.

Thanks for reading.

-Geoff
