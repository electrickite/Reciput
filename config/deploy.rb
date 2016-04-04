# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'reciput'

set :linked_dirs, %w{ log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads }
set :linked_files, %w{ config/database.yml config/secrets.yml }

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :rake, 'cache:clear'
      end
    end
  end

end
