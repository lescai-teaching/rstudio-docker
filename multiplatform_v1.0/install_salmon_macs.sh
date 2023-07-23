#!/bin/bash
# Used in Docker build to set platform dependent variables

case $TARGETPLATFORM in
    "linux/amd64")
	### THIS RUNS AMD64 COMMANDS
	conda install --quiet --yes salmon && conda clean --all -f -y
	;;
    "linux/arm64") 
	## THIS RUNS APPLE SILICON / ARM64 COMMANDS
	cd /opt/software
	tar -xvzf compiled_arm64_salmon-1.10.1.tar.gz
	;;
esac