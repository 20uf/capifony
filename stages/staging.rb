##########################################################################
#
# This file is part of the demo project.
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# @author Michael COULLERET <michael@coulleret.pro>
#
##########################################################################

set :deploy_to, "/project/directory"

set :branch, "staging"
set :symfony_env_prod, "staging"

set :application, "demo"
set :domain, "ssh.demo.domain"
set :user, "jenkins"

set :use_sudo, false
set :keep_releases, 2

role :web, domain
role :app, domain, :primary => true

# Repository
set :repository, "ssh://git@gitlab.domain.example"
set :scm, :git
set :deploy_via, :copy_with_triggers

## Symfony2
set :symfony_console, "bin/console"
set :controllers_to_clear, ["app_*.php"]
set :shared_files, ["app/config/parameters.yml"]
set :use_composer, true
set :composer_install_flags, '--no-dev --no-interaction --quiet --optimize-autoloader'
set :composer_dump_autoload_flags, '--optimize'
set :update_vendors, false
set :copy_vendors, false
set :writable_dirs, ["var/cache", "var/logs"]
set :webserver_user, "www-data"
set :use_set_permissions, true
set :dump_assetic_assets, true
set :model_manager, "doctrine" # ORM

set :build_dir, "#{strategy.destinationrelease}"

after 'deploy', 'deploy:cleanup'

on 'strategy:before:compression', 'deploy:assets:bower'
after 'deploy', 'deploy:assets:bazinga'
after 'deploy', 'deploy:assets:jsrouting'
