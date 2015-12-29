PROJECT_DIR='/dd-agent-omnibus'
CORE_INTEGRATIONS_DIR='/core-integrations'

namespace :agent do
  desc 'Cleanup generated files'
  task :clean do
    puts "Clean up generated files"
    sh "rm -rf /var/cache/*"
    sh "rm -f /etc/init.d/datadog-agent"
    sh "rm -rf /etc/dd-agent"
    sh "rm -rf /opt/datadog-agent"
  end

  desc 'Dev cleanup'
  task :'dev-clean' do
    sh "apt-get remove datadog-agent -y"
    Rake::Task["agent:clean"].invoke
  end

  desc 'Pull the dd-agent-omnibus repo'
  task :'pull-omnibus' do
    sh "git fetch --all"
    sh "git checkout $OMNIBUS_BRANCH"
    sh "git reset --hard origin/$OMNIBUS_BRANCH"
  end

  desc 'Pull the core-integration repo'
  task :'pull-core-integration' do
    # cd $CORE_INTEGRATIONS_DIR
    # git fetch --all
    # git checkout $CORE_INTEGRATIONS_BRANCH
    # git reset --hard origin/$CORE_INTEGRATIONS_BRANCH
    # FIXME: uncomment when repo is public, do manually in the meantime
    # sh "cd $PROJECT_DIR"
  end

  desc 'Execute script'
  task :'execute-script', [:integration_name] do |t, args|
    sh "bundle update"
    # FIXME: build all integrations when no integration name is passed
    sh "resources/datadog-integrations/omnibus_build_integration.sh #{args.integration_name}"
  end

  desc 'Build an integration'
  task :'build-integration', [:integration_name] do |t, args|
    Rake::Task["agent:clean"].invoke
    Rake::Task["env:import-rpm-key"].invoke
    Rake::Task["agent:pull-omnibus"].invoke
    Rake::Task["agent:pull-core-integration"].invoke
    Rake::Task["agent:execute-script"].invoke(args.integration_name)
  end

end

namespace :env do
  desc 'Import signing RPM key'
  task :'import-rpm-key' do
    # If an RPM_SIGNING_PASSPHRASE has been passed, let's import the signing key
    # sh "if [ -n '$RPM_SIGNING_PASSPHRASE' ]; then gpg --import /keys/RPM-SIGNING-KEY.private; fi"
  end
end

