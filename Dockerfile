FROM rocker/verse:4.1.0


RUN apt-get update && \
    apt-get install -y libgdal-dev

ENV CPLUS_INCLUDE_PATH "/usr/include/gdal"
ENV C_INCLUDE_PATH "/usr/include/gdal"


RUN Rscript -e "install.packages('BiocManager', repos = 'https://cloud.r-project.org')"

RUN Rscript -e "BiocManager::install(c(\
    'tidyverse', \
    'Gviz', \
    'VariantAnnotation', \
    'GenomicFeatures', \
    'rtracklayer', \
    'Biostrings', \
    'knitr'\
    ))"

RUN Rscript -e "install.packages('kableExtra', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "install.packages('remotes', repos = 'https://cloud.r-project.org')"

RUN Rscript -e "BiocManager::install(c(\
    'DESeq2', \
    'tximport', \
    'tximeta' \
    ))"

RUN Rscript -e "BiocManager::install(c(\
    'chipseq'\
    ))"

RUN mkdir -p /opt/software
WORKDIR /opt/software

RUN apt-get update
RUN apt-get install -y wget curl \
    cmake \
    build-essential \
    g++ \
    python-dev \
    autotools-dev \
    libicu-dev \
    libbz2-dev \
    libboost-all-dev \
    python3 python3-pip

RUN archi=`arch` && \
    if [[ $archi == 'arm64' ]]; then wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh && \
    bash Miniforge3-Linux-aarch64.sh -b -f -p /usr/local; \
    else wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh && \
    bash Miniforge3-Linux-x86_64.sh -b -f -p /usr/local; fi

RUN conda config --system --prepend channels bioconda
RUN conda config --system --prepend channels conda-forge
RUN conda config --system --prepend channels defaults

RUN conda install --quiet --yes \
    samtools \
    bioconda::macs2 \
    bioconda::salmon && \
    conda clean --all -f -y

    