#!/bin/bash
# Used in Docker build to set platform dependent variables

case $TARGETPLATFORM in
    "linux/amd64")
	### THIS RUNS AMD64 COMMANDS
	export PATH="${PATH}:/opt/software/tinytext/bin/x86_64-linux"
	;;
    "linux/arm64") 
	## THIS RUNS APPLE SILICON / ARM64 COMMANDS
	cd /opt/software/tinytext/bin/
	dir=`ls -d /`
	export PATH="${PATH}:/opt/software/tinytext/bin/${dir}"
	;;
esac