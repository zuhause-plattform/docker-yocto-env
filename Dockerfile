ARG version=18.04

FROM ossystems/yocto-env:$version

# Install repo tool
RUN apt-get update && apt-get install -y \
     curl && \
     rm -rf /var/lib/apt/lists/* && \
     curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo && chmod a+rx /bin/repo
