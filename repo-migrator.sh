#!/bin/bash
#
# Usage: repo-migrator.sh
#

source "$DIR/project-migrator.sh"
source "$DIR/maven-migrator.sh"

updateMavenVersion() {
  updateMvnProperty "project.build.plugin.version" "${projectBuildPluginVersion}"
  updateMvnProperty "tester.version" "${testerVersion}"
  artifactVersion $convert_to_version
}

downloadEngine
raiseProject
updateMavenVersion
