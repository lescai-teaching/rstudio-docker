FROM ghcr.io/lescai-teaching/rstudio-docker-amd64:4.0.1

RUN /opt/software/bin/conda config --add pinned_packages 'salmon >1.5.1'

RUN /opt/software/bin/conda install --quiet --yes \
    biopython \
    matplotlib \
    numpy \
    pandas && \
    /opt/software/bin/conda clean --all -f -y