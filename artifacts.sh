#!/bin/bash

mkdir -p artifacts

find . -type d -exec test -f {}/pom.xml \; -print0 | while read -r -d '' dir; do
  project_name=$(basename "$dir")
  if [ -d "$dir/target" ]; then
    for jar in "$dir/target"/*.jar; do
      if [ -f "$jar" ]; then
        cp "$jar" "artifacts/${project_name}-$(basename "$jar")"
        echo "Copied $jar to artifacts/${project_name}-$(basename "$jar")"
      fi
    done
  fi
done

echo "All JAR files copied to artifacts/ directory"
