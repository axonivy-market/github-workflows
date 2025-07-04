updateMvnProperty() {
  name="$1"
  value="$2"
  mvn -B versions:set-property versions:commit "-Dproperty=${name}" "-DnewVersion=${value}" -DallowSnapshots=true -DprocessAllModules
}

artifactVersion() {
  newVersion="$1"
  # if root pom.xml exists
  if [ -f "pom.xml" ]; then
    mvn -B versions:set -DnewVersion=${newVersion} -DgenerateBackupPoms=false -DprocessAllModules=true
    mvn -B versions:use-latest-versions -DgenerateBackupPoms=false -DprocessAllModules
    updateMvnProperty
  fi
  # update version in pom.xml
  # loop through all folders
  for d in */ ; do
    echo "Updating $d"
    mvn -f $d -B versions:set -DnewVersion=$convert_to_version -DgenerateBackupPoms=false -DprocessAllModules=true
    mvn -f $d -B versions:use-latest-versions -DgenerateBackupPoms=false -DprocessAllModules
  done
}
