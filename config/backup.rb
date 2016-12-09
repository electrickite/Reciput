# encoding: utf-8

##
# Backup v4.x Configuration
#
# Documentation: http://backup.github.io/backup
# Issue Tracker: https://github.com/backup/backup/issues

require 'yaml'
RAILS_ENV = ENV['RAILS_ENV'] || 'development'
db_config = YAML.load_file(File.expand_path('../database.yml', __FILE__))[RAILS_ENV]
rails_root = File.expand_path('../../', __FILE__)

##
# Backup Generated: full_backup
# You can run the backup with the following command:
#
# $ backup perform --trigger backup --root-path . --config_file config/backup.rb \
#   --data-path db --log-path log --tmp-path tmp
#
# For more information about Backup's components, see the documentation at:
# http://backup.github.io/backup
#
Backup::Model.new(:full_backup, 'Database and file backup for Reciput') do
  ##
  # Archive [Archive]
  #
  archive :uploads_archive do |archive|
    archive.root rails_root
    archive.add 'public/system/'
  end

  case db_config['adapter']
  when 'sqlite3'
    ##
    # SQLite [Database]
    #
    database SQLite do |db|
      db.path = db_config['database']

      # Set the location of this utility if it cannot be found in your $PATH
      db.sqlitedump_utility = ENV['SQLITE_PATH'] || 'sqlite3'
    end
  when 'mysql2'
    ##
    # MySQL [Database]
    #
    database MySQL do |db|
      db.name      = db_config['database']
      db.username  = db_config['username'] || 'root'
      db.password  = db_config['password']
      db.host      = db_config['host'] || 'localhost'
      db.port      = db_config['port'] || 3306
      db.socket    = db_config['socket'] if db_config['socket']
    end
  when 'postgresql'
    ##
    # PostgreSQL [Database]
    #
    database PostgreSQL do |db|
      db.name      = db_config['database'] || ENV['USER']
      db.username  = db_config['username'] || ENV['USER']
      db.password  = db_config['password']
      db.host      = db_config['host'] || 'localhost'
      db.port      = db_config['port'] || 5432
      db.socket    = db_config['socket'] if db_config['socket']
    end
  end

  ##
  # Local (Copy) [Storage]
  #
  store_with Local do |local|
    local.path = ENV['BACKUP_PATH'] || 'tmp/backups/'
    local.keep = 5
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

  if ENV['MAIL_TO']
    ##
    # Mail [Notifier]
    #
    notify_by Mail do |mail|
      mail.on_success = true
      mail.on_warning = true
      mail.on_failure = true

      mail.delivery_method = :sendmail
      mail.from            = ENV['MAIL_FROM'] if ENV['MAIL_FROM']
      mail.to              = ENV['MAIL_TO']
    end
  end
end
