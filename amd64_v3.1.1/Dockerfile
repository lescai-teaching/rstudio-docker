FROM ghcr.io/lescai-teaching/rstudio-docker-amd64:3.1.0

COPY install.R /.
RUN Rscript /install.R

ENV PATH "${PATH}:/opt/software/bin"  
