FROM ghcr.io/lescai-teaching/rstudio-docker:5.0.1

ARG TARGETPLATFORM
ARG TARGETARCH

## fix versions of annotation databases necessary to maintain
## the reproducibility of the enrichment analysis
## due to gene-ontology version of database

COPY install_version-specific_packages.R /opt/software/install_version-specific_packages.R
RUN mkdir -p /opt/software/packages
COPY ./packages/org.Hs.eg.db_3.12.0.tar.gz /opt/software/packages/org.Hs.eg.db_3.12.0.tar.gz
COPY ./packages/AnnotationDbi_1.52.0.tar.gz /opt/software/packages/AnnotationDbi_1.52.0.tar.gz
COPY ./packages/clusterProfiler_3.18.1.tar.gz /opt/software/packages/clusterProfiler_3.18.1.tar.gz
COPY ./packages/DO.db_2.9.tar.gz /opt/software/packages/DO.db_2.9.tar.gz
COPY ./packages/DOSE_3.16.0.tar.gz /opt/software/packages/DOSE_3.16.0.tar.gz

RUN /opt/software/install_version-specific_packages.R
