#!/bin/bash

########################################################
# init.bash
# 
# IMPORTANT : 
# This file is intended to run be run while running SonarQube on the docker image "lequal/sonarqube".
# This file should be run as an ENTRYPOINT of docker's image. If you re-use the lequal/sonarqube image, call this file inside your entrypoint.
# The Dockerfile lequal/sonarqube inherit Sonarqube 6.7.1 image. This script run Sonarqube's entrypoint.
# 
# Description :
# This file configure Sonarqube.
#
########################################################

sonar_configuration="INIT"

# Call for configure-cat script to set quality profiles and quality gates.
bash /tmp/configure-cat.bash &
su sonarqube
exec ${SONARQUBE_HOME}/bin/run.sh
