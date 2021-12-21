FROM ghcr.io/lescai-teaching/rstudio-docker-arm64:3.1.0

COPY install.R /.
USER rstudio
RUN Rscript /install.R
USER root
