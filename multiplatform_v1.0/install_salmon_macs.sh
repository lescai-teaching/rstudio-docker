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
	curl -LOJ https://github.com/COMBINE-lab/salmon/archive/refs/tags/v1.5.2.tar.gz
	tar -xvzf salmon-1.5.2.tar.gz
	mkdir -p /opt/software/salmon-1.5.2/build
	cd /opt/software/salmon-1.5.2/build
	cmake ..
	make
	make install
	;;
esac