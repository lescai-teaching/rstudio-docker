FROM ghcr.io/lescai-teaching/rstudio-docker-amd64:3.1.0

RUN apt-get update
RUN apt-get install -y \
    libglpk40

RUN Rscript -e "BiocManager::install(c(\
    'clusterProfiler'\
    ))"

ENV PATH "${PATH}:/opt/software/bin"  
