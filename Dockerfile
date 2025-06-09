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

# Expose SSH port 
EXPOSE 22
