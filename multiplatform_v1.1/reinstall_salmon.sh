#!/bin/bash
# Used in Docker build to set platform dependent variables

case $TARGETPLATFORM in
    "linux/amd64")
	### THIS RUNS AMD64 COMMANDS
	rm /usr/local/bin/salmon
	mkdir -p /opt/software
	cd /opt/software
	wget https://github.com/COMBINE-lab/salmon/releases/download/v1.10.0/salmon-1.10.0_linux_x86_64.tar.gz
	tar -xvzf salmon-1.10.0_linux_x86_64.tar.gz
	export PATH=${PATH}:/opt/sowftware/salmon-latest_linux_x86_64/bin/
	;;
    "linux/arm64") 
	## THIS RUNS APPLE SILICON / ARM64 COMMANDS
	# DO NOTHING
	;;
esac