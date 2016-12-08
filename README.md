Reciput
=======

A place to put your recipes!

Prerequisites
-------------

The following dependencies must be installed to run this application.

  * [Ruby][1] 2.3.1
  * [Bundler][2]
  * [ImageMagick][3]

Installation
------------

Change to the project directory, be sure the correct version of Ruby is in use,
and install all gem dependencies:

    $ cd reciput
    $ ruby -v
    $ bundle install

Create the development SQLite database and load the schema:

    $ bundle exec rake db:migrate

Create a `.env` file to hold environment variables for this application. This
file will be loaded each time the server is started. See `.env.example` for
details.

    $ cp .env.example .env

Use
---

Start a local Rails server by running:

    $ bundle exec rails server

Your application should now be available on [http://localhost:3000](http://localhost:3000).
You can also access your application via the Rails console with:

    $ bundle exec rails console


[1]: https://www.ruby-lang.org/en/
[2]: http://bundler.io
[3]: http://www.imagemagick.org/script/index.php
