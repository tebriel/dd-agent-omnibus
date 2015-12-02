name "dd-integrations-mysql"
default_version "0.0.1"

build do
  puts 'hello world'
  command "ls #{install_dir}/embedded/bin/"
  # command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/bin\" boto3"
end
