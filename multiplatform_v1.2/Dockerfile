FROM ghcr.io/lescai-teaching/rstudio-docker:5.0.1

ARG TARGETPLATFORM
ARG TARGETARCH

## fix versions of annotation databases necessary to maintain
## the reproducibility of the enrichment analysis
## due to gene-ontology version of database

COPY install_version-specific_packages.R /opt/software/install_version-specific_packages.R
RUN Rscript /opt/software/install_version-specific_packages.R
