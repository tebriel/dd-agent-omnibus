name "dd-pycurl-check"
default_version "0.0.1"

dependency 'python'
dependency 'pip'
dependency "curl"
dependency "gdbm" if (ohai['platform'] == "mac_os_x" or ohai['platform'] == "freebsd" or ohai['platform'] == "aix")
dependency "libgcc" if (ohai['platform'] == "solaris2" and Omnibus.config.solaris_compiler == "gcc")

build do
  build_env = {
    "PATH" => "/#{install_dir}/embedded/bin:#{ENV['PATH']}",
    "ARCHFLAGS" => "-arch x86_64"
  }
  command "apt-get update && apt-get install -y --force-yes datadog-agent"
  command "#{install_dir}/embedded/bin/pip install -I --target=#{install_dir}/3rd-party/#{name} pycurl", :env => build_env
  command "apt-get remove -y --force-yes datadog-agent"
  delete "#{install_dir}/uselessfile"
end
