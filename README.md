# Word Definer by Andrew Giang
This project contains a `word` class and a `definition` class. The live site have a homepage that lists all words. When a word is clicked, it should lead to a page with the word's definitions. It also have features to add, delete, and update words and add, delete, and update definitions to selected words.

## Technology Used
* _Ruby_
* _Docker_
* _Ruby Gems: rspec, pry_
* _Sinatra_

## Objectives

* Full CRUD functionality for both `Word`s and `Definition`s.
* Routes are named using RESTful conventions.
* Sinatra application uses views, instance variables and forms.
* Sinatra routes process GET and POST requests/responses.
* Project includes thorough and passing integration specs as well as specs for both classes.
* Allow users to sort Words alphabetically.
* Allow users to search for a particular Word in the application.
* Include a randomizer button where users can randomly look at a Word.
* Include a page where users can view all Words and their corresponding definitions in one list.

## Set up and Installation

* This project runs on Ruby or Docker. You need to have either application installed on your local machine.
* Download or Clone this directory into your local drive. 
* The repository contains a simple project that tests a simple class that checks for anagram and antigrams. To run tests on the current code, simply run the command `docker-compose up` in the root directory of this project.
* To run tests on your own code, replace the `lib` and `spec` directories with your own source code (for `lib`) and tests (for `spec`). Then run the command `docker-compose up --build` in terminal
* You can create an alias for the following commands. The alias should look something like this:
      
      dspec ()
      {
        docker-compose down
        docker-compose up --build
        docker-compose run --rm app
      }
      
* With this alias, the `dspec` command will automatically run RSpec tests. You can use `binding.pry` as needed.

## Known Bugs

* none

## License

[MIT](https://en.wikipedia.org/wiki/MIT_License)

## Contact Information

Andrew Giang | giang184@gmail.com