require "./lib/ostools.rb"

name 'dd-mysql-check'
maintainer 'Datadog Packages <package@datadoghq.com>'
homepage 'http://www.datadoghq.com'
install_dir '/opt/datadog-agent'

build_version Omnibus::BuildVersion.semver

# ------------------------------------
# Dependencies
# ------------------------------------

# creates required build directories
dependency 'preparation'


dependency 'dd-mysql-check'


exclude '\.git*'
exclude 'bundler\/git'
