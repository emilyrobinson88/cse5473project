# cse5473project
-  Coltin Clark
-  Leah Gillespie
-  Jimmy McElwain
-  Emily Robinson

# Deployed at
# Models
-	Password
    +	Has the form to evaluate how strong a password is
-	IP Address
    + Has the values for IP addresses and passwords that the user has entered
# Views
-	Password
    + Index.html
      - Shows the list of the most common passwords in 2020 and the most common passwords that have been entered into the database
    + Show.html
      - This page shows the password that the user had entered and how strong it is by showing how long it would take to brute force the password
    + Edit.html
      - This page has a form so that the user can enter their password so that it can be evaluated
-	IP Address
    + Index.html
      - Shows the list of the ip addresses that were entered and the password that was entered into the database
# Controllers
-   Passwords
    + passwords_controller.rb
      - Contains basic functions for creation and viewing of passwords
      - If a password is entered and it is a new, unique password, this creates the password and corresponding IP address entry and sets the password count to 1
      - If a password is entered and it is not unique, this increments the password count and creates a new IP address entry with that password
-   IP Addresses
    + ip_addresses_controller.rb
      - Contains basic functions for creation and viewing of IP addresses
# Database
-	Schema
    + common_passwords
      - Common passwords is a table containing the most common passwords and the number of exposures for each common password
    + ip_addresses
      - IP Adresses is a table containing each IP Address/Password pair submitted so far
    + passwords
      - Passwords is a table containing all of the passwords entered thus far and how many times they were entered
-   Seeds
    + seeds.rb
      - Contains a webscraper created using Mechanize which scrapes NordPass's most common password list
    + Most common passwords of 2020.html
      - NordPass's most common password list page HTML, created by webscraper to populate common passwords database and cached for easier access upon setup
# Helpers
-   Password
    + passwords_helper.rb
      - Contains all of the code for the password strength algorithm
      - Contains code for comparing with database/currently stored passwords
      - Contains code which retrieves the most common passwords to be displayed on index
# How to Operate
- In a command line terminal, run:
    $ bundle install
    $ rails db:setup
    $ rails server
- Open a web browser (firefox recommended) and navigate to localhost:3000/passwords
- From there, follow links to navigate the website
- To see the list of IP Addresses go to localhost:3000/ip_addresses
