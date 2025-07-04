#!/bin/bash
#
# Usage: project-migrator.sh <version> <repository-name>
#

source "$DIR/project-migrator.sh"
source "$DIR/maven-migrator.sh"

updateMavenVersion() {
  updateMvnProperty "project.build.plugin.version" "${projectBuildPluginVersion}"
  updateMvnProperty "tester.version" "${testerVersion}"
  artifactVersion $convert_to_version
}

convert_to_version=$1

downloadEngine
raiseProject
updateMavenVersion
