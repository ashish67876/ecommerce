#!/bin/bash

# Define the Maven command executable name
MAVEN_COMMAND=mvn

# Initialize a counter for failures
failures=0

# Find all directories that contain a pom.xml file and process them
find . -type d -exec test -f {}/pom.xml \; -print0 | while read -r -d '' dir; do
  echo "Processing directory: $dir"
  if ! (cd "$dir" && $MAVEN_COMMAND clean package -DskipTests); then
    echo "Failed to process directory: $dir"
    ((failures++))
  fi
done

# Report the result
if [ $failures -gt 0 ]; then
  echo "There were $failures failures."
  exit 1
else
  echo "All directories processed successfully."
  exit 0
fi
