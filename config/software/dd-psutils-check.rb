name "dd-postgres-check"
default_version "0.0.1"

dependency 'python'
dependency 'pip'

build do
  command "apt-get update && apt-get install -y --force-yes datadog-agent"
  command "#{install_dir}/embedded/bin/pip install -I --target=#{install_dir}/3rd-party/#{name} psutil"
  command "apt-get remove -y --force-yes datadog-agent"
  delete "#{install_dir}/uselessfile"
end
