default_run_options[:pty] = true  # Must be set for the password prompt from git to work

set :application, "server-check-dummy"
set :repository,  "git@github.com:carlo/server-check-dummy.git"

set :user, "chef"
set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache

role :web, "46.4.107.153"                          # Your HTTP server, Apache/etc
role :app, "46.4.107.153"                          # This may be the same as your `Web` server
role :db,  "46.4.107.153", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end