NAME=$1
echo "building integration $NAME"

echo "generating files"
cp resources/datadog-integrations/project.rb config/projects/dd-$NAME-check.rb
cp resources/datadog-integrations/software.rb config/software/dd-$NAME.rb

echo "building project"
bin/omnibus build dd-$NAME-check
