FROM ghcr.io/lescai-teaching/rstudio-docker-arm64:4.0.0


RUN conda install --quiet --yes \
    biopython \
    matplotlib \
    numpy \
    pandas && \
    conda clean --all -f -y


