FROM amoselb/rstudio-m1

RUN apt-get clean
RUN apt-get update
RUN apt-get install -y \
    libcurl4-openssl-dev \
    libfontconfig1-dev \
    libxml2 \
    libxml2-dev \
    libz-dev \
    libbz2-dev \
    libclang-dev \
    liblzma-dev \
    python3 \
    python3-pip \
    wget

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

RUN Rscript -e "BiocManager::install(c('ggtree'))"

RUN Rscript -e "BiocManager::install(c(\
    'msa', \
    'seqinr', \
    'plotly'\
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


RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh

RUN mkdir -p /opt/software
RUN bash Miniforge3-Linux-aarch64.sh -b -f -p /opt/software

RUN /opt/software/bin/conda config --system --prepend channels bioconda
RUN /opt/software/bin/conda config --system --prepend channels conda-forge
RUN /opt/software/bin/conda config --system --prepend channels defaults

RUN /opt/software/bin/conda install --quiet --yes \
    samtools \
    bioconda::macs2 \
    bioconda::salmon && \
    /opt/software/bin/conda clean --all -f -y

ENV PATH "${PATH}:/opt/software/bin"  