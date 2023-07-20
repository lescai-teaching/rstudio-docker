ARG VARIANT="4.3.1"
FROM rocker/r-ver:${VARIANT}

ARG TARGETPLATFORM
ARG TARGETARCH

ENV S6_VERSION=v2.1.0.2
ENV RSTUDIO_VERSION=daily
ENV DEFAULT_USER=rstudio
ENV PANDOC_VERSION=default
ENV PATH=/usr/lib/rstudio-server/bin:$PATH
ENV CTAN_REPO=https://mirror.ctan.org/systems/texlive/tlnet
ENV PATH=$PATH:/usr/local/texlive/bin/linux

RUN /rocker_scripts/install_rstudio.sh
RUN /rocker_scripts/install_pandoc.sh

RUN set -e

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libxml2-dev \
    libcairo2-dev \
    libgit2-dev \
    default-libmysqlclient-dev \
    libpq-dev \
    libsasl2-dev \
    libsqlite3-dev \
    libssh2-1-dev \
    libxtst6 \
    libcurl4-openssl-dev \
    unixodbc-dev
    
EXPOSE 8787

CMD ["/init"]

RUN install2.r --error --skipinstalled \
    tidyverse \
    devtools \
    rmarkdown \
    BiocManager \
    vroom \
    gert \
    knitr

## dplyr database backends
RUN install2.r --error --skipmissing --skipinstalled \
    dbplyr \
    DBI \
    dtplyr \
    nycflights13 \
    Lahman \
    RMariaDB \
    RPostgres \
    RSQLite \
    fst

## clean R installation folders 
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /tmp/downloaded_packages

## Strip binary installed lybraries from RSPM
## https://github.com/rocker-org/rocker-versioned2/issues/340
RUN strip /usr/local/lib/R/site-library/*/libs/*.so

# Check the tidyverse core packages' version
RUN echo -e "Check the tidyverse package...\n"

RUN R -q -e "library(tidyverse)"

RUN echo -e "\nInstall tidyverse package, done!"

RUN /rocker_scripts/install_verse.sh

### INSTALL COURSE SPECIFIC PACKAGES


RUN Rscript -e "install.packages('BiocManager', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "BiocManager::install(c(\
    'Gviz', \
    'VariantAnnotation', \
    'GenomicFeatures', \
    'rtracklayer', \
    'Biostrings'\
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

RUN mkdir -p /opt/install
COPY install_cluster_packages.R /opt/install/install_cluster_packages.R
RUN Rscript /opt/install/install_cluster_packages.R

## clean R installation folders 
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /tmp/downloaded_packages

COPY install_conda.sh /opt/install/install_conda.sh
RUN bash /opt/install/install_conda.sh

RUN conda config --system --prepend channels bioconda
RUN conda config --system --prepend channels defaults

RUN mkdir -p /opt/software
RUN apt remove -y cmake
WORKDIR /opt/software
RUN wget https://github.com/Kitware/CMake/releases/download/v3.21.3/cmake-3.21.3.tar.gz
RUN tar -xvzf cmake-3.21.3.tar.gz
WORKDIR /opt/software/cmake-3.21.3
RUN ./configure
RUN make
RUN make install
RUN ln -s /usr/local/bin/cmake /usr/bin/cmake

RUN mkdir -p /opt/software
COPY install_salmon_macs.sh /opt/install/install_salmon_macs.sh
RUN bash /opt/install/install_salmon_macs.sh

COPY install_xaringan.R /opt/install/install_xaringan.R
RUN Rscript /opt/install/install_tex.R

WORKDIR /home/rstudio

ENV DISABLE_AUTH=true