#!/bin/bash
# Used in Docker build to set platform dependent variables

case $TARGETPLATFORM in
    "linux/amd64")
	### THIS RUNS AMD64 COMMANDS
	cd /opt/software
	wget https://github.com/tukaani-project/xz/releases/download/v5.2.12/xz-5.2.12.tar.gz
	tar -xvzf xz-5.2.12.tar.gz
	cd xz-5.2.12
	./configure --enable-shared
	make
	make install
	ldconfig
	/rocker_scripts/install_rstudio.sh
	install2.r rmarkdown
	;;
    "linux/arm64") 
	## THIS RUNS APPLE SILICON / ARM64 COMMANDS
	/rocker_scripts/install_rstudio.sh
	install2.r rmarkdown
	;;
esac