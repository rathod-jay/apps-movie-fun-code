#!/bin/bash

set -e +x

pushd apps-movie-fun-code
  echo "Packaging WAR"
  ./mvnw clean package -DskipTests
popd

war_count=`find apps-movie-fun-code/target -type f -name *.war | wc -l`

if [ $war_count -gt 1 ]; then
  echo "More than one war is found, don't know which one to deploy. Exiting"
  exit 1
fi

find apps-movie-fun-code/target -type f -name *.war -exec cp "{}" package-output/attendee-service.war \;

echo "Done packaging"
exit 0
