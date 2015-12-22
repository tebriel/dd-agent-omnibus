name=$1
echo "generating files"
cp resources/datadog-integrations/project.rb config/projects/dd-$name-check.rb
cp resources/datadog-integrations/software.rb config/software/dd-$name.rb

echo "building project"
bin/omnibus build dd-$name-check
