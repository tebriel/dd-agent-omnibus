NAME=$1
echo "building integration $NAME"

echo "generating files"
(echo '<% name="$1" %>' && resources/datadog-integrations/project.rb) | erb > config/projects/dd-$NAME-check.rb
(echo '<% name="$1" %>' && resources/datadog-integrations/software.rb) | erb > config/software/dd-$NAME.rb

echo "building project"
bin/omnibus build dd-$NAME-check


(echo '<% name="Joe"; quality="fantastic" %>' && cat 1.erb) | erb
