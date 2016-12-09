desc "Back up database and files"
task :backup do
  Bundler.with_clean_env do
    sh "backup perform --trigger full_backup --root-path '#{Rails.root}' --config_file config/backup.rb --data-path db --log-path log --tmp-path tmp"
  end
end
