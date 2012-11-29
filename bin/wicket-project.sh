#!/bin/bash

NAME=${1:-quickstart}
VERSION=${2:-6.4.0-SNAPSHOT}
GROUP=${3:-com.mycompany}
REPO="https://repository.apache.org/"

if [[ "$VERSION" == *"-SNAPSHOT"* ]]; then
	REPO="https://repository.apache.org/content/repositories/snapshots/"
fi

mvn archetype:generate -DarchetypeGroupId=org.apache.wicket -DarchetypeArtifactId=wicket-archetype-quickstart -DarchetypeVersion=$VERSION -DgroupId=$GROUP -DartifactId=$NAME -DarchetypeRepository=$REPO -DinteractiveMode=false
