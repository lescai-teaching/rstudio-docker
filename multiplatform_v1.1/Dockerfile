FROM ghcr.io/lescai-teaching/rstudio-docker:5.0.0

RUN mkdir -p /opt/software
COPY reinstall_salmon.sh /opt/software/reinstall_salmon.sh

RUN /opt/software/reinstall_salmon.sh