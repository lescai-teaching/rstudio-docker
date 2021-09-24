FROM rocker/verse:4.1.0

RUN install2.r --error \
    --deps TRUE \ 
    DESeq2 \
    VariantAnnotation \
    GenomicRanges \
    rtracklayer \
    Gviz \
    chipseq \
    tximport \
    tximeta \
    qqman \
    plotly

RUN install2.r rmarkdown,knitr


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

    