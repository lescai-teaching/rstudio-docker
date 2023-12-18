FROM ghcr.io/lescai-teaching/rstudio-docker:5.0.3

ARG TARGETPLATFORM
ARG TARGETARCH

COPY reinstall_rstudio.sh /opt/software/reinstall_rstudio.sh
RUN /opt/software/reinstall_rstudio.sh