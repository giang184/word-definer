## Description

This repository provides the necessary Docker configuration to use Sinatra for Ruby and Rails Week 2 at Epicodus. This includes the following:

* Running a Sinatra local server.
* Attaching to the local server to use Pry for debugging.
* Running tests with RSpec and integration tests with Capybara.

This is a template repository, which means you should create a new repository using `ruby-sinatra-docker-container` as a template. Once you've done so, clone the repository on your desktop and `cd` into the repository via the command line.

This project also includes most of the basic scaffolding for a Sinatra project, including `app.rb`, `lib` and `spec` directories, and other necessary configuration such as a `Gemfile` and `config.ru` file. While you can run the included tests and `app.rb`, they are just for demonstration and you'll want to replace these files with your own.

### Running a Server

To run a local server, type the following into the command line (you must be in the root directory of the project):

```
$ docker-compose up --build
```

Once the server is running, you can navigate to `http://localhost:4567/` to see the home page of the Sinatra application. You can do this as soon as you clone the project. If everything is working correctly, you'll see `Hello world!` at `http://localhost:4567/`.

When you're done running the server, you should always type in `docker-compose down` to gracefully stop the container.

### Running Tests

To run tests, run the following command:

```
$ docker-compose run --rm web bundle exec rspec
```

There are two specs included in the basic scaffolding - an RSpec test and a Capybara integration test. You can run the command above without making any code changes to see the test output.

Pry will work with this command and there's no need to do any extra work such as attaching to an image. Just add `binding.pry` to your code where needed (and don't forget to `require 'pry'` if it's needed in a file).

You may want to alias the above command. For example:

```bash
# Add this to your shell configuration.

alias sspec="docker-compose run --rm web bundle exec rspec"
```

### Using Pry with Sinatra

You can use Pry with Sinatra but you will not automatically have an interactive terminal for typing in Pry commands. You need to complete a few additional steps to use Pry.

First, you need to get the container ID of the Docker process running your Sinatra application. (Note that your Sinatra application must be running when you do this.) You can do that by typing the following in the terminal:

```
$ docker ps
```

This will list all Docker processes. You'll likely see something like this (though you may have more processes running):

```
CONTAINER ID   IMAGE              COMMAND                  CREATED             STATUS          PORTS                    NAMES
ed9caa7f61ab   sinatra-test_web   "bundle exec rackup …"   14 minutes ago      Up 14 minutes   0.0.0.0:4567->4567/tcp   sinatra-test_web_1
85d3c125977e   postgres:12.1      "docker-entrypoint.s…"   About an hour ago   Up 14 minutes   5432/tcp                 sinatra-test_db_1
```

A container's ID will change every time you re-run a Docker image so you'll always need to grab a fresh container ID. In the example above, we'd grab the container ID related to `sinatra-test_web`. Your image name will probably be `[APP_NAME]_web` where `[APP_NAME]` is the name of your application.

Next, in a new terminal tab, copy the container ID and type in the following command (replacing `[CONTAINER_ID]` with the unique ID you copied from the step above):

```
$ docker attach [CONTAINER_ID]
```

For instance, with the processes listed in the example above, we'd type, `$ docker attach ed9caa7f61ab`.