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
# Data
-	Password
    + The data was scraped from NordPass's most common password list
# Helpers
-   Password
    + passwords_helper.rb
      - Contains all of the code for the password strength algorithm
      - Contains code for comparing with database/currently stored passwords
      - Contains code which retrieves the most common passwords to be displayed on index
# How to Operate
- /passwords
