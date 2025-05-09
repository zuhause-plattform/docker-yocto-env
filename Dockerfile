ARG version=18.04

FROM ossystems/yocto-env:$version

# Install repo tool
RUN apt-get update && apt-get install -y \
     curl gnupg python3-pip dos2unix vim pipx && \
     rm -rf /var/lib/apt/lists/* && \
     curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo && chmod a+rx /bin/repo
RUN sed -i 's/\/usr\/bin\/env python/\/usr\/bin\/env python3/' /bin/repo
RUN pipx ensurepath

# Install kas
ENV PIPX_BIN_DIR="/usr/local/bin"
RUN pipx install kas