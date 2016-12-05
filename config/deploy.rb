# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'reciput'

set :linked_dirs, %w{ log tmp/pids tmp/cache tmp/config tmp/sockets public/system vendor/bundle }
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

namespace :paperclip do
  desc 'Build missing paperclip styles'
  task :build_missing_styles do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'paperclip:refresh:missing_styles'
        end
      end
    end
  end
end

after 'deploy:cleanup', 'paperclip:build_missing_styles'
