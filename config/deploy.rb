
set :application, "quotes-rails"
set :repo_url, "git@github.com:GregVaz/quotes-rails-7-turbo-rails.git"
set :branch, 'main'
set :deploy_to, "/home/deploy/#{fetch :application}"
append :linked_files, "config/master.key"
set :linked_dirs, %w{
	bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/reports public/uploads
	}

set :rbenv_type, :quote
set :rbenv_ruby, '3.1.2'

set :format, :pretty
set :passenger_restart_with_touch, true

# set :linked_files, %w{config/authorize_net.yml config/database.yml config/secrets.yml}
# set :linked_dirs, %w{
# 	bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/reports public/uploads
# }

# before 'deploy:check:linked_files', 'config:push'

# after 'deploy:publishing', 'deploy:restart'
# after 'deploy:restart' #, 'deploy:warmup'
# after 'deploy:finishing', 'deploy:cleanup'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
