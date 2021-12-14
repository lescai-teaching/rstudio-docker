FROM ghcr.io/lescai-teaching/rstudio-docker-amd64:3.1.0

RUN /opt/software/bin/conda config --system --prepend channels bioconda
RUN /opt/software/bin/conda config --system --prepend channels conda-forge
RUN /opt/software/bin/conda config --system --prepend channels defaults

RUN /opt/software/bin/conda install --quiet --yes \
    bioconda::bioconductor-clusterprofiler \
    /opt/software/bin/conda clean --all -f -y

ENV PATH "${PATH}:/opt/software/bin"  
