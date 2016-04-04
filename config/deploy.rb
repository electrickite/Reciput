# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'reciput'

set :linked_dirs, %w{ log tmp/pids tmp/cache tmp/sockets vendor/bundle }
set :linked_files, %w{ config/database.yml .env }

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :rake, 'tmp:clear'
      end
    end
  end

end
