FROM microsoft/dotnet:2.0-sdk-jessie

ENV MONO_VERSION 5.8.0.108
ENV SONAR_SCANNER_MSBUILD 4.0.2.892
ENV DOCKER_VERSION 17.06.2

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

# Install mono
RUN echo "deb http://download.mono-project.com/repo/debian jessie/snapshots/$MONO_VERSION main" > /etc/apt/sources.list.d/mono-official.list \
  && apt-get update \
  && apt-get install -y binutils curl mono-devel ca-certificates-mono fsharp mono-vbnc nuget referenceassemblies-pcl unzip zip \
  && rm -rf /var/lib/apt/lists/* /tmp/*

# Install Java 8
RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" \
    && echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections \
    && apt-get update \
    && apt-get install -y oracle-java8-installer

# Install Sonar Scanner
RUN wget https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/$SONAR_SCANNER_MSBUILD/sonar-scanner-msbuild-$SONAR_SCANNER_MSBUILD.zip \
    && unzip sonar-scanner-msbuild-$SONAR_SCANNER_MSBUILD.zip -d /sonar-scanner \
    && rm sonar-scanner-msbuild-$SONAR_SCANNER_MSBUILD.zip \
    && chmod +x -R /sonar-scanner

# Install docker binaries
RUN apt-get update \
    && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && apt-key fingerprint 0EBFCD88 \
    && add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable" \
    && apt-get update \
    && apt-get install -y docker-ce=$DOCKER_VERSION~ce-0~debian