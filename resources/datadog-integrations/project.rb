# FIXME: use templates
name 'dd-twemproxy-check'
maintainer 'Datadog Packages <package@datadoghq.com>'
homepage 'http://www.datadoghq.com'
install_dir '/opt/datadog-agent'

# FIXME: build version
build_version Omnibus::BuildVersion.semver


dependency 'preparation'  # creates required build directories
dependency 'dd-twemproxy'

extends_package 'datadog-agent'

exclude '\.git*'  # FIXME: is this needed?
