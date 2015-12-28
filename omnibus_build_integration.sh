#!/bin/bash -e

###########################
#
# Command Line Arguments
# - name of the integration to build  # FIXME: optional
#
###########################

PROJECT_DIR=/dd-agent-omnibus
CORE_INTEGRATIONS_DIR=/core-integrations

echo "Clean up generated files"
rm -rf /var/cache/*
rm -f /etc/init.d/datadog-agent
rm -rf /etc/dd-agent
rm -rf /opt/datadog-agent

# If an RPM_SIGNING_PASSPHRASE has been passed, let's import the signing key
if [ -n "$RPM_SIGNING_PASSPHRASE" ]; then
  gpg --import /keys/RPM-SIGNING-KEY.private
fi


echo "Pull core-integrations"
cd $CORE_INTEGRATIONS_DIR
# git fetch --all
# git checkout $CORE_INTEGRATIONS_BRANCH
# git reset --hard origin/$CORE_INTEGRATIONS_BRANCH
# FIXME: uncomment when repo is public, do manually in the meantime

echo "Pull dd-agent-omnibus"
cd $PROJECT_DIR
git fetch --all
git checkout $OMNIBUS_BRANCH
git reset --hard origin/$OMNIBUS_BRANCH

echo "execute scripts"
cd $PROJECT_DIR
bundle update
# FIXME: build all integrations when no integration name is passed
resources/datadog-integrations/omnibus_build_integration.sh $1
