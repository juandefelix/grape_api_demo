## GRAPE API DEMO  
This is a Ruby demo that generates an API to retrieve and store records.  
Neither Rails or Active Record was used in order to write the code. Just **Ruby**, **Grape** (API), and **Rack** (web server).  
The demo is focused on code organization, and maintainability.  
The tests provide 100% of code coverage.

### Set Up
Clone the repo  
`git clone https://github.com/juandefelix/grape_api_demo && cd grape_api_demo`  
Load your dependencies:  
`bundle install`  
Start the server:  
`rackup config.ru`  
You can open in your browser the file `index.html` and see a simple display of the results of calling the API methods.

### How to use the demo
- Display the records: click on any of the links to display and sort the records. The "Name" link filters the records on reversed order by first name.
- Save a record: In the text field, enter a record in one of these two formats:
  - `LastName | FirstName | FavoriteColor | DateOfBirth`
  - `LastName, FirstName, FavoriteColor, DateOfBirth`
