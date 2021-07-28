FROM mcr.microsoft.com/dotnet/sdk:5.0.302

# Dockerfile meta-information
LABEL maintainer="NOS Inovação S.A." \
    app_name="dotnet-sonar"

ENV SONAR_SCANNER_MSBUILD_VERSION=5.2.2.33595 \
    DOTNETCORE_SDK=5.0.302 \
    DOTNETCORE_RUNTIME=5.0.8 \
    NETAPP_VERSION=net5.0 \
    DOCKER_VERSION=5:20.10.7~3-0~debian-buster \
    CONTAINERD_VERSION=1.4.8-1 \
    OPENJDK_VERSION=11 \
    NODEJS_VERSION=16

# Linux update
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

RUN mkdir -p /usr/share/man/man1mkdir -p /usr/share/man/man1

# Install Java
RUN apt-get install -y openjdk-$OPENJDK_VERSION-jre

# Install NodeJs
RUN wget https://deb.nodesource.com/setup_$NODEJS_VERSION.x \
    && bash setup_$NODEJS_VERSION.x \
    && apt-get install -y nodejs

# Install all necessary additional software
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && apt-key fingerprint 0EBFCD88 \
    && add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable" \
    && apt-get update \
    && apt-get install -y \
        docker-ce=$DOCKER_VERSION \
        docker-ce-cli=$DOCKER_VERSION \
        containerd.io=$CONTAINERD_VERSION

# Install Sonar Scanner
RUN apt-get install -y unzip \
    && wget https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/$SONAR_SCANNER_MSBUILD_VERSION/sonar-scanner-msbuild-$SONAR_SCANNER_MSBUILD_VERSION-$NETAPP_VERSION.zip \
    && unzip sonar-scanner-msbuild-$SONAR_SCANNER_MSBUILD_VERSION-$NETAPP_VERSION.zip -d /sonar-scanner \
    && rm sonar-scanner-msbuild-$SONAR_SCANNER_MSBUILD_VERSION-$NETAPP_VERSION.zip \
    && chmod +x -R /sonar-scanner

# Cleanup
RUN apt-get -q autoremove \
    && apt-get -q clean -y \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*.bin
