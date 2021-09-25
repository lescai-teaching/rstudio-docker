FROM ghcr.io/intensive-school-virology-unipv/rstudio:main


RUN Rscript -e "BiocManager::install(c(\
    'DESeq2', \
    'tximport', \
    'tximeta' \
    ))"

RUN Rscript -e "BiocManager::install(c(\
    'chipseq'\
    ))"

RUN mkdir -p /opt/software

RUN apt-get update
RUN apt-get install -y python3 python3-pip wget

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh && \
    bash Miniforge3-Linux-x86_64.sh -b -f -p /opt/software

RUN /opt/software/bin/conda config --system --prepend channels bioconda
RUN /opt/software/bin/conda config --system --prepend channels conda-forge
RUN /opt/software/bin/conda config --system --prepend channels defaults

RUN /opt/software/bin/conda install --quiet --yes \
    samtools \
    bioconda::macs2 \
    bioconda::salmon && \
    /opt/software/bin/conda clean --all -f -y

ENV PATH "${PATH}:/opt/software/bin"    