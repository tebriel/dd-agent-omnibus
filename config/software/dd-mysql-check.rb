name "dd-mysql-check"
default_version "0.0.1"

dependency 'python'
dependency 'pip'

build do
  command "apt-get update && apt-get install -y --force-yes datadog-agent"
  command "#{install_dir}/embedded/bin/pip install -I --target=#{install_dir}/3rd-party/#{name} boto3"
  command "apt-get remove datadog-agent"
end
