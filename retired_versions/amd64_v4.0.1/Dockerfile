FROM ghcr.io/lescai-teaching/rstudio-docker-amd64:3.1.1

COPY install.R /.
RUN Rscript /install.R
ENV PATH "${PATH}:/opt/software/tinytext/bin/x86_64-linux"