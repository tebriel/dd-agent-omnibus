# FIXME: use templates
name "dd-twemproxy"
# FIXME: version
default_version "0.0.1"

build do
  mkdir "#{install_dir}/3rd-party/twemproxy"
  # FIXME: blacklist files
  copy "/core-integrations/twemproxy/*", "#{install_dir}/3rd-party/twemproxy"
  command "#{install_dir}/embedded/bin/pip install -I --target=#{install_dir}/3rd-party/twemproxy -r #{install_dir}/3rd-party/twemproxy/requirements.txt"
  delete "#{install_dir}/uselessfile"
end
