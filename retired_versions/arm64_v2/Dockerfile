FROM ghcr.io/lescai-teaching/rstudio-docker-arm64:1.1.0

## not necessary to install conda
## the base image has mambaforge
## at /usr/local/mambaforge/


# ### samtools not available on arm64 repos
# RUN apt-get install -y samtools

# ### salmon not available on conda arm64 repos

WORKDIR /opt/software
# RUN pip install numpy
# RUN pip install MACS2

# RUN apt-get update && apt-get install -y \
#     libboost-all-dev \
#     unzip \
#     autoconf

RUN apt remove -y cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.21.3/cmake-3.21.3.tar.gz
RUN tar -xvzf cmake-3.21.3.tar.gz
WORKDIR /opt/software/cmake-3.21.3
RUN ./configure
RUN make
RUN make install
RUN ln -s /usr/local/bin/cmake /usr/bin/cmake

WORKDIR /opt/software
RUN curl -LOJ https://github.com/COMBINE-lab/salmon/archive/refs/tags/v1.5.2.tar.gz
RUN tar -xvzf salmon-1.5.2.tar.gz
RUN mkdir -p /opt/software/salmon-1.5.2/build
WORKDIR /opt/software/salmon-1.5.2/build
RUN cmake ..
RUN make
RUN make install

WORKDIR /home/rstudio