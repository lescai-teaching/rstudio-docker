#!/bin/bash
# Used in Docker build to set platform dependent variables

case $TARGETPLATFORM in
    "linux/amd64")
	### THIS RUNS AMD64 COMMANDS
	mkdir -p /opt/software
	cd /opt/software
	wget https://github.com/COMBINE-lab/salmon/releases/download/v1.10.0/salmon-1.10.0_linux_x86_64.tar.gz
	tar -xvzf salmon-1.10.0_linux_x86_64.tar.gz
	mv /opt/software/salmon-latest_linux_x86_64/bin/* /usr/local/bin/.
	mv /opt/software/salmon-latest_linux_x86_64/lib/* /usr/local/lib/.
	cd /opt/software
	wget https://sourceforge.net/projects/libpng/files/zlib/1.2.9/zlib-1.2.9.tar.gz/download -O zlib-1.2.9.tar.gz
	tar -xvzf zlib-1.2.9.tar.gz
	cd /usr/local/lib/
	rm libz.so*
	cd /opt/software/zlib-1.2.9
	./configure; make; make install
    Rscript -e 'BiocManager::install("clusterProfiler", force=TRUE)'
	;;
    "linux/arm64") 
	## THIS RUNS APPLE SILICON / ARM64 COMMANDS
	# DO NOTHING
	;;
esac