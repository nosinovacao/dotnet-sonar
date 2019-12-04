FROM mcr.microsoft.com/dotnet/core/sdk:3.1.100

# Dockerfile meta-information
LABEL maintainer="NOS Inovação S.A." \
    app_name="dotnet-sonar"

# Reviewing this choices
ENV SONAR_SCANNER_MSBUILD_VERSION=4.8.0.12008 \
    DOTNETCORE_SDK=3.1.100 \
    DOTNETCORE_RUNTIME=3.1.0 \
    DOCKER_VERSION=5:19.03.2~3-0~debian-buster \
    CONTAINERD_VERSION=1.2.6-3

RUN apt-get update \
    && apt-get dist-upgrade -y

# Install all necessary additional software (utils, jre, docker binaries)
RUN apt-get install -y \
        openjdk-11-jre \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
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

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - \
    && apt-get install -y \
        nodejs \
        autoconf \
        libtool \
        nasm

# Register Microsoft key and feed
RUN wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb

# Install DotNetCore 3.1 Runtime-Only for SonarScanner
RUN apt-get update -y \
    && apt-get install apt-transport-https -y \
    && apt-get update -y \
    && apt-get install aspnetcore-runtime-3.1 -y

# Install Sonar Scanner
RUN apt-get install -y unzip \
    && wget https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/$SONAR_SCANNER_MSBUILD_VERSION/sonar-scanner-msbuild-$SONAR_SCANNER_MSBUILD_VERSION-netcoreapp3.0.zip \
    && unzip sonar-scanner-msbuild-$SONAR_SCANNER_MSBUILD_VERSION-netcoreapp3.0.zip -d /sonar-scanner \
    && rm sonar-scanner-msbuild-$SONAR_SCANNER_MSBUILD_VERSION-netcoreapp3.0.zip \
    && chmod +x -R /sonar-scanner

# Cleanup
RUN apt-get -q autoremove \
    && apt-get -q clean -y \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*.bin

