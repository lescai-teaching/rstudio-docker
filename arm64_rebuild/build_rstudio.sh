#!/bin/bash
# This script installs R and builds RStudio Desktop for ARM Chromebooks running debian stretch

# Install R; Debian stretch has latest version
apt-get update && \
apt-get install -y r-base \
r-base-dev \
wget \
lsb-* \
openjdk-*-jdk \
libxml2-dev \
curl

# Set RStudio version
VERS=v1.4.1717

# Download RStudio source
mkdir -p /opt/downloads
cd /opt/downloads/
wget -O $VERS https://github.com/rstudio/rstudio/tarball/$VERS
mkdir /opt/downloads/rstudio-$VERS
tar xvf /opt/downloads/$VERS -C /opt/downloads/rstudio-$VERS --strip-components 1
rm /opt/downloads/$VERS

# Run environment preparation scripts
cd /opt/downloads/rstudio-$VERS/dependencies/linux/
apt-get install -y sudo
# ./install-dependencies-stretch --exclude-qt-sdk

# Run common environment preparation scripts
apt-get install -y git
# No arm build for pandoc, so install outside of common script
apt-get install -y pandoc \
libcurl4-openssl-dev

cd /opt/downloads/rstudio-$VERS/dependencies/common/
#./install-common
./install-gwt
./install-dictionaries
./install-mathjax
./install-boost
#./install-pandoc
./install-libclang
./install-packages

# Add pandoc folder to override build check
mkdir /opt/downloads/rstudio-$VERS/dependencies/common/pandoc

# Get Closure Compiler and replace compiler.jar
cd /opt/downloads
wget http://dl.google.com/closure-compiler/compiler-latest.zip
unzip compiler-latest.zip
rm COPYING README.md compiler-latest.zip
mv closure-compiler*.jar /opt/downloads/rstudio-$VERS/src/gwt/tools/compiler/compiler.jar

# Configure cmake and build RStudio

apt-get install -y libyaml-cpp-dev
mkdir -p /opt/yaml-cpp
cd /opt/yaml-cpp/
git clone https://github.com/jbeder/yaml-cpp.git
cd yaml-cpp/
mkdir build
cd build/
cmake ..
cd /opt/downloads/rstudio-$VERS/
mkdir build
cd build
export YAML_CPP_INCLUDE_DIR=/opt/yaml-cpp/yaml-cpp/build
export YAML_CPP_LIBRARIES=/opt/yaml-cpp/yaml-cpp/build
cmake -DRSTUDIO_TARGET=Server -DCMAKE_BUILD_TYPE=Release ..
make install

# Additional install steps
useradd -r rstudio-server
cp /usr/local/lib/rstudio-server/extras/init.d/debian/rstudio-server /etc/init.d/rstudio-server
chmod +x /etc/init.d/rstudio-server 
ln -f -s /usr/local/lib/rstudio-server/bin/rstudio-server /usr/sbin/rstudio-server
chmod 777 -R /usr/local/lib/R/site-library/

# Setup locale
apt-get install -y locales
DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
#echo 'export LANG=en_US.UTF-8' >> ~/.bashrc
#echo 'export LANGUAGE=en_US.UTF-8' >> ~/.bashrc

# Clean the system of packages used for building
apt-get autoremove -y cabal-install ghc openjdk-7-jdk pandoc libboost-all-dev
rm -r -f /opt/downloads/rstudio-$VERS
apt-get autoremove -y

# Start the server
rstudio-server start

# Go to localhost:8787