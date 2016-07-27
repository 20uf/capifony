##########################################################################
#
# This file is part of the gsef project.
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# @author Michael COULLERET <michael@coulleret.pro>
#
##########################################################################

load 'deploy' if respond_to?(:namespace)

require 'capifony_symfony2'
require 'capistrano-strategy-copy-with-triggers'

logger.level = Logger::MAX_LEVEL

#set :php_bin, "/usr/local/php7.0/bin/php"
set :php_bin, "/usr/local/php5.6/bin/php"

# Staging
set :stages, %w(production staging testing)
set :default_stage, "testing"
set :stage_dir, "capifony/stages"
require 'capistrano/ext/multistage'

namespace :deploy do
  namespace :assets do
    desc "Bower install assets locally"
    task :bower, :only => { :primary => true } do
      capifony_pretty_print "--> Installing bower components"
      system("cd #{build_dir} && bower install")
      capifony_puts_ok
    end
  end
end

namespace :deploy do
  namespace :assets do
    desc "Bazinga dump js translation locally"
    task :bazinga, :only => { :primary => true } do
      capifony_pretty_print "--> Dump js translations"
      invoke_command "sh -c 'cd #{latest_release} && #{php_bin} bin/console bazinga:js-translation:dump --env=#{symfony_env_prod}'"
      capifony_puts_ok
    end
  end
end

namespace :deploy do
  namespace :assets do
    desc "Fos js routing dump"
    task :jsrouting, :only => { :primary => true } do
      capifony_pretty_print "--> Dump js translations"
      invoke_command "sh -c 'cd #{latest_release} && #{php_bin} bin/console fos:js-routing:dump --env=#{symfony_env_prod}'"
      capifony_puts_ok
    end
  end
end

namespace :deploy do
  namespace :assets do
    desc "Assets dump"
    task :assetic, :only => { :primary => true } do
      capifony_pretty_print "--> Assetic Dump"
      invoke_command "sh -c 'cd #{latest_release} && #{php_bin} bin/console assetic:dump --env=#{symfony_env_prod}'"
      capifony_puts_ok
    end
  end
end
