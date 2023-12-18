FROM ghcr.io/lescai-teaching/rstudio-docker:5.0.3

ARG TARGETPLATFORM
ARG TARGETARCH

RUN /rocker_scripts/install_rstudio.sh
RUN install2.r rmarkdown