FROM ghcr.io/lescai-teaching/rstudio-docker-amd64:4.0.1

RUN /opt/software/bin/conda install --quiet --yes \
    biopython \
    matplotlib \
    numpy \
    pandas \
    salmon && \
    /opt/software/bin/conda clean --all -f -y