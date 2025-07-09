FROM r-base:latest


# Install system dependencies for most R packages
RUN apt-get update && \
    apt-get install -y \
      zlib1g-dev \
      libbz2-dev \
      liblzma-dev \
      libssl-dev \
      libgsl-dev \
      pkg-config \
      libcurl4-openssl-dev \
      libxml2-dev \
      libgit2-dev \
      libssh2-1-dev \
      libcairo2-dev \
      libpng-dev \
      libjpeg-dev \
      libtiff5-dev \
      libfreetype6-dev \
      libfontconfig1-dev \
      default-jdk \
      libicu-dev \
      openssh-server \
    && rm -rf /var/lib/apt/lists/*

    
# Install BiocManager and Bioconductor/R packages non-interactively
RUN R -e 'install.packages("BiocManager", repos="https://cloud.r-project.org")' && \
    R -e 'BiocManager::install(c("ChIPseeker","TxDb.Mmusculus.UCSC.mm39.knownGene","org.Mm.eg.db"), ask=FALSE, update=FALSE)'


# Expose SSH port 
EXPOSE 22
