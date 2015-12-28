NAME=$1
echo "building integration $NAME"

echo "generating files"
(echo '<% name="'$NAME'" %>' && cat resources/datadog-integrations/project.rb.erb) | erb > config/projects/dd-$NAME-check.rb
(echo '<% name="'$NAME'" %>' && cat resources/datadog-integrations/software.rb.erb) | erb > config/software/dd-$NAME.rb

echo "building project"
bin/omnibus build dd-$NAME-check


(echo '<% name="Joe"; quality="fantastic" %>' && cat 1.erb) | erb
