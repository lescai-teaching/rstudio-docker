FROM ghcr.io/lescai-teaching/rstudio-docker-arm64:3.1.0

COPY install.R /.
RUN chown -R rstudio:rstudio /usr/local/lib/R/library
USER rstudio
RUN Rscript /install.R
USER root
