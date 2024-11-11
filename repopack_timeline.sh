#!/bin/bash
repopack --include "lib/**/*.dart" --style xml -o timeline-doc.xml; git add .; git commit -m "chore: update repopack output for timeline documentation"
