FROM ghcr.io/lescai-teaching/rstudio-docker:5.0.2

ARG TARGETPLATFORM
ARG TARGETARCH

COPY install_amd64only.sh /opt/software/install_amd64only.sh
RUN /opt/software/install_amd64only.sh