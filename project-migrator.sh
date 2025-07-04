#!/bin/bash

if [ -z "$workDir" ]; then
  workDir=$(mktemp -d -t projectConvertXXX)
fi
if [ -z "$engineUrl" ]; then
  engineUrl="https://developer.axonivy.com/permalink/dev/axonivy-engine.zip"
fi

downloadEngine(){
  if ! [ -d "${workDir}/engine" ]; then
    echo "Downloading engine from ${engineUrl}"
    (cd "$workDir" && curl --progress-bar -L -O "${engineUrl}") 
    zipped=$(find "${workDir}" -maxdepth 1 -name "*.zip")
    unzip -qq "${zipped}" -d "${workDir}/engine"
    rm "${zipped}"
  fi
}

raiseProject() {
  gitDir=$(pwd)
  gitName=$(basename ${gitDir})
  echo "Searching projects in ${gitDir}"
  projects=()
  for ivyPref in $(find ${gitDir} -name "ch.ivyteam.ivy.designer.prefs"); do
    project=$(dirname $(dirname $ivyPref))
    if ! [ -f "${project}/pom.xml" ]; then
      continue # prefs file not in natural project structure
    fi
    projects+=("${project}")
  done

  if [ ${#projects[@]} -gt 0 ]; then
    echo "Collected projects: ${projects[@]}"
    ${workDir}/engine/bin/EngineConfigCli migrate-project ${projects[@]}

    git add . #include new+moved files!
    git commit -m "Raise project to ${convert_to_version}"
  else
    echo "No projects found in ${gitDir}"
  fi
}
