Reciput
=======

A place to put your recipes!

Prerequisites
-------------

The following dependencies must be installed to run this application.

  * [Ruby][1] 2.5.1
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

Deployment
----------

### Capistrano

Reciput provides a base [Capistrano][4] configuration. You'll need to create a
deploy file for each environment you wish to deploy to. Ex:

    $ cp config/deploy/production.rb.example config/deploy/production.rb
    $ vi config/deploy/production.rb
    $ bundle exec cap production deploy

### Backups

A basic model for the [Backup][5] gem is provided. You must install the gem
separately. (it is not part of the application bundle)

    $ gem install backup -v5.0.0.beta.2

Database and file system backups are run with a rake task. By default, backups
will be placed in the application `tmp` directory. This is probably not ideal,
so you can set the backup path in an environment variable. Similarly, you can
set an email address that will receive backup notifications.

    $ BACKUP_PATH=/path/to/backups MAIL_TO=admin@example.com bundle exec rake backup


[1]: https://www.ruby-lang.org/en/
[2]: http://bundler.io
[3]: http://www.imagemagick.org/script/index.php
[4]: http://capistranorb.com
[5]: http://backup.github.io/backup/
