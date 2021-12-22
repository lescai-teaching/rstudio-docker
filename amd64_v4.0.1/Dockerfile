FROM ghcr.io/lescai-teaching/rstudio-docker-amd64:3.1.1

COPY install.R /.
USER rstudio
RUN Rscript /install.R
USER root