FROM ghcr.io/lescai-teaching/rstudio-docker-amd64:3.1.0

RUN apt-get update
RUN apt-get install -y \
    libc6-dev

COPY install.R /.
RUN Rscript /install.R

ENV PATH "${PATH}:/opt/software/bin"  
