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

