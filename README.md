# dotnet-sonar

[![Docker Cloud Status](https://img.shields.io/docker/cloud/automated/nosinovacao/dotnet-sonar.svg)](https://hub.docker.com/r/nosinovacao/dotnet-sonar)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/nosinovacao/dotnet-sonar.svg)](https://hub.docker.com/r/nosinovacao/dotnet-sonar)
[![Docker Pulls](https://img.shields.io/docker/pulls/nosinovacao/dotnet-sonar.svg)](https://hub.docker.com/r/nosinovacao/dotnet-sonar)

[![Docker Pulls](https://img.shields.io/docker/v/nosinovacao/dotnet-sonar?sort=semver)](https://hub.docker.com/r/nosinovacao/dotnet-sonar/tags)
[![Docker Pulls](https://img.shields.io/docker/v/nosinovacao/dotnet-sonar?sort=date)](https://hub.docker.com/r/nosinovacao/dotnet-sonar/tags)

This is a container used to build dotnet projects and provide SonarQube analysis using SonarQube MSBuild Scanner.

It also allows you to run Docker in Docker using a docker.sock mount.

----

This latest image was built with the following components:

* dotnetcore-sdk-3.1.301
* dotnetcore-runtime-3.1.301 (required by Sonar Scanner)
* SonarQube MSBuild Scanner 4.10.x
* OpenJDK Java Runtime 11.x (required by Sonar Scanner)
* Docker binaries 19.03.x (for running Docker in Docker using the docker.sock mount)
* NodeJS 12.x


## Supported tags and respective `Dockerfile` links

> Tags are written using the following pattern: `dotnet-sonar:<year>.<month>.<revision>`

* `20.07.0`, `latest` [(20.07.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/master/Dockerfile)
* `19.12.0` [(19.12.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/19.12.0/Dockerfile)
* `19.10.1` [(19.10.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/19.10.1/Dockerfile)
* `19.09.0` [(19.09-0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/19.09.0/Dockerfile)
* `19.08.0` [(19.08.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/19.08.0/Dockerfile)
* `19.01.0` [(19.01.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/19.01.0/Dockerfile)
* `18.12.1` [(18.12.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/18.12.1/Dockerfile)
* `18.09.0` [(18.09.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/18.09.0/Dockerfile)
* `18.07.0` [(18.07.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/18.07.0/Dockerfile)
* `18.05.0` [(18.05.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/18.05.0/Dockerfile)
* `18.03.1` [(18.03.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/18.03.1/Dockerfile)
* `18.03.0` [(18.03.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/18.03.0/Dockerfile)
* `2-4.0.2` [(2-4.0.2/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/2-4.0.2/Dockerfile)

More info on docker hub: <https://hub.docker.com/r/nosinovacao/dotnet-sonar/>

## Compiling dotnet code with SonarQube Analysis

Full documentation: <https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+MSBuild>

### Inside container

### Using Docker

**Inside container:**

```bash
$ dotnet /sonar-scanner/SonarScanner.MSBuild.dll begin /k:sonarProjectKey
$ dotnet build
$ dotnet /sonar-scanner/SonarScanner.MSBuild.dll end
```

**Configure external SonarQube Server:**

```bash
$ dotnet /sonar-scanner/SonarScanner.MSBuild.dll begin /k:sonarProjectKey /d:sonar.host.url="<SonarQubeServerUrl:Port>" /d:sonar.login="<SonarQubeServerToken>"
$ dotnet build
$ dotnet /sonar-scanner/SonarScanner.MSBuild.dll end  /d:sonar.login="<SonarQubeServerToken>"
```

**Outside container:**

Simple Usage:
```bash
$ docker run -it --rm -v <my-project-source-path>:/source nosinovacao/dotnet-sonar:latest bash -c "cd source \
    && dotnet /sonar-scanner/SonarScanner.MSBuild.dll begin /k:sonarProjectKey /name:sonarProjectName /version:buildVersion \
    && dotnet restore \
    && dotnet build -c Release \
    && dotnet /sonar-scanner/SonarScanner.MSBuild.dll end"
```

Advance Usage:

```bash
$ docker run -it --rm \
    -v <my-project-source-path>:/source \
    -v <my-nugetconfig-source-path>:/nuget \
$ dotnet-sonar:19.10.1 \
$ bash -c \
    "cd source \
    && dotnet /sonar-scanner/SonarScanner.MSBuild.dll begin \
    /k:<ProjectName> /name:<my-project-name> /version:<my-project-version> \
    /d:sonar.host.url="<my-sonar-server-url>" \
    /d:sonar.login="<my-sonar-server-user>" \
    /d:sonar.password="<my-sonar-server-pass>" \
    /d:sonar.cs.opencover.reportsPaths='tests/**/coverage.opencover.xml' \
    && dotnet restore --configfile /nuget/NuGet.Config \
    && dotnet build -c Release \
    && dotnet publish -c Release -r linux-x64 -o deployment \
    && dotnet test --no-build -c Release --filter "Category=Unit" --logger trx --results-directory testResults /p:CollectCoverage=true /    p:CoverletOutputFormat=\"opencover\" \
    && dotnet /sonar-scanner/SonarScanner.MSBuild.dll end \
    /d:sonar.login="<my-sonar-server-user>" \
    /d:sonar.password="<my-sonar-server-pass>""
```

The script above does the following:

* Mounts your project folder to the container's /source folder
* Mounts your nuget config to the container's /nuget folder (optional if no private nuget server is used)
* Begins the sonarscanner with the sonarqube server credentials
* Performs a dotnet restore with the nuget config in /nuget folder
* Executes the build command
* Publishes the build to the deployment folder
* Runs the tests and stores the test results in testResults folder. Change this command to your unit tests needs
* Ends the sonarscanner and publishes the sonarqube analysis results to the sonarqube server

### Using Jenkins pipeline

The following pipeline code will:

* Start a sonar scanning session
* Build dotnet projects
* Run tests with coverage analysis (using coverlet) and publish them using the Jenkins XUnit publisher
* End a sonar scanning session
* [OPTIONAL] In the end, it waits for sonar's quality gate status and sets the build outcome

*Note that in order for coverage analysis to work, you need to add the coverlet NuGet package to the unit test project.*

```groovy
def envVariables = [
    'HOME=/tmp/home',
    'DOTNET_CLI_TELEMETRY_OPTOUT=1'
]

node('somenode-with-docker')
{
    withSonarQubeEnv('my-jenkins-configured-sonar-environment')
    {
        docker.image('nosinovacao/dotnet-sonar:latest').inside()
        {
            withEnv(envVariables)
            {
                stage('build')
                {
                    checkout scm
                    sh "dotnet /sonar-scanner/SonarScanner.MSBuild.dll begin /k:someKey /name:someName /version:someVersion /d:sonar.cs.opencover.reportsPaths='tests/**/coverage.opencover.xml'"
                    sh "dotnet build -c Release /property:Version=someVersion"
                    sh "rm -drf ${env.WORKSPACE}/testResults"
                    sh (returnStatus: true, script: "find tests/**/* -name \'*.csproj\' -print0 | xargs -L1 -0 -P 8 dotnet test --no-build -c Release --logger trx --results-directory ${env.WORKSPACE}/testResults /p:CollectCoverage=true /p:CoverletOutputFormat=opencover")
                    step([$class: 'XUnitPublisher', testTimeMargin: '3000', thresholdMode: 1, thresholds: [[$class: 'FailedThreshold', unstableThreshold: '0']
                            , [$class: 'SkippedThreshold']], tools: [[$class: 'MSTestJunitHudsonTestType', deleteOutputFiles: true, failIfNotNew: false
                            , pattern: 'testResults/**/*.trx', skipNoTestFiles: true, stopProcessingIfError: true]]])
                    sh "dotnet /sonar-scanner/SonarScanner.MSBuild.dll end"
                }
            }
        }
    }
}

timeout(time: 1, unit: 'HOURS')
{
    def qualityGate = waitForQualityGate()
    if (qualityGate.status == 'ERROR')
    {
        currentBuild.result = 'UNSTABLE'
    }
}
```

**If you want to use Docker in Docker**:

Please note that if you want to use Docker inside Docker (DinD) you need to perform additional actions when mounting the docker image in the pipeline.

**The following actions will expose your host to several security vulnerabilities** and therefore this should only be used when you absolutely must to:

```groovy
docker.image('nosinovacao/dotnet-sonar:latest').inside("--group-add docker -v /var/run/docker.sock:/var/run/docker.sock")
{
    // Some stuff
    docker.image.('hello-world:latest').inside()
    {
        sh "echo 'hello from docker inside docker'"
    }
}
```

The above code will:

* Add current jenkins user to the Docker group
* Mount the docker socket into the container so that you can control the Docker instance on the host machine

## Code Coverage

The above examples already implement the code-coverage analysis, **provided you add the coverlet NuGet package to your unit test project**.

If you want to know more, check: <https://dev.to/deinsoftware/net-core-unit-test-and-code-coverage-with-visual-studio-code-37bp>.

Also, coverlet documentation here: <https://github.com/tonerdo/coverlet/>.
