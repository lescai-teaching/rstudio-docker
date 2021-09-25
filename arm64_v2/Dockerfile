


RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh

RUN mkdir -p /opt/software
RUN bash Miniforge3-Linux-aarch64.sh -b -f -p /opt/software

RUN /opt/software/bin/conda config --system --prepend channels bioconda
RUN /opt/software/bin/conda config --system --prepend channels conda-forge
RUN /opt/software/bin/conda config --system --prepend channels defaults

### samtools not available on arm64 repos
RUN apt-get install -y samtools



### salmon not available on conda arm64 repos

WORKDIR /opt/software

RUN apt remove -y cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.21.3/cmake-3.21.3.tar.gz
RUN tar -xvzf cmake-3.21.3.tar.gz
WORKDIR /opt/software/cmake-3.21.3
RUN ./configure
RUN make
RUN make install

RUN curl -LOJ https://github.com/COMBINE-lab/salmon/archive/refs/tags/v1.5.2.tar.gz
RUN tar -xvzf salmon-1.5.2.tar.gz
RUN mkdir -p /opt/software/salmon-1.5.2/build
WORKDIR /opt/software/salmon-1.5.2/build
RUN apt-get update && apt-get install -y libboost-all-dev
