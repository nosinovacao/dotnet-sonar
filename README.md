# dotnet-sonar

This is a container used to build dotnet projects and provide SonarQube analysis using SonarQube MSBuild Scanner.

It also allows you to run Docker in Docker using a docker.sock mount.

This image was built with the following components:

* dotnet-sdk-2.2.100 (stretch)
* SonarQube MSBuild Scanner 4.4.2.1543
* OpenJDK Java 8 (required for Sonar Scanner)
* Docker binaries 17.06.2 (for running Docker in Docker using the docker.sock mount)

## Tags

Tags are written using the following pattern: `dotnet-sonar:<year>.<month>.<revision>`

* dotnet-sonar:18.09.0
* dotnet-sonar:18.07.0
* dotnet-sonar:18.03.1
* dotnet-sonar:18.03.0
* dotnet-sonar:2-4.0.2

More info on docker hub: <https://hub.docker.com/r/nosinovacao/dotnet-sonar/>

## Compiling dotnet code with SonarQube Analysis

Full documentation: <https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+MSBuild>

### Inside container

### Using Docker

**Inside container:**

```bash
dotnet /sonar-scanner/SonarScanner.MSBuild.dll begin /k:sonarProjectKey
dotnet build
dotnet /sonar-scanner/SonarScanner.MSBuild.dll end
```
**Configure external SonarQube Server:**

```bash
dotnet /sonar-scanner/SonarScanner.MSBuild.dll begin /k:sonarProjectKey /d:sonar.host.url="<SonarQubeServerUrl:Port>" /d:sonar.login="<SonarQubeServerToken>"
dotnet build
dotnet /sonar-scanner/SonarScanner.MSBuild.dll end  /d:sonar.login="<SonarQubeServerToken>"
```

**Outside container:**

```bash
docker run -it --rm -v <my-project-source-path>:/source nosinovacao/dotnet-sonar:latest bash -c "cd source \
&& dotnet /sonar-scanner/SonarScanner.MSBuild.dll begin /k:sonarProjectKey /name:sonarProjectName /version:buildVersion \
&& dotnet restore \
&& dotnet build -c Release \
&& dotnet /sonar-scanner/SonarScanner.MSBuild.dll end"
```




### Using Jenkins pipeline

The following pipeline code will:

* Start a sonar scanning session
* Build dotnet projects
* Run tests with coverage analysis (using coverlet) and publish them using the Jenkins XUnit publisher
* End a sonar scanning session
* [OPTIONAL] In the end, it waits for sonar's quality gate status and sets the build outcome

*Note that in order for coverage analysis to work, you need to add the coverlet NuGet package to the unit test project.*

```groovy
node('somenode-with-docker') {
    withSonarQubeEnv('my-jenkins-configured-sonar-environment') {
        docker.image('nosinovacao/dotnet-sonar:latest').inside() {
            withEnv(['HOME=/tmp/home','DOTNET_CLI_TELEMETRY_OPTOUT=1']) {
                stage('build') {
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

timeout(time: 1, unit: 'HOURS') {
    def qualityGate = waitForQualityGate()
    if (qualityGate.status == 'ERROR') {
        currentBuild.result = 'UNSTABLE'
    }
}
```

**If you want to use Docker in Docker**:

Please note that if you want to use Docker inside Docker (DinD) you need to perform additional actions when mounting the docker image in the pipeline.

**The following actions will expose your host to several security vulnerabilities** and therefore this should only be used when you absolutely must to:

```groovy
docker.image('nosinovacao/dotnet-sonar:latest').inside("--group-add docker -v /var/run/docker.sock:/var/run/docker.sock") {
    // Some stuff
    docker.image.('hello-world:latest').inside() {
        sh "echo 'hello from docker inside docker'"
    }
}
```

The above code will:

* Add current jenkins user to the Docker group
* Mount the docker socket into the container so that you can control the Docker instance on the host machine

## Code Coverage

The above examples already implement the code-coverage analysis, **provided you add the coverlet NuGet package to your unit test project**.
If you want to know more, check: <https://medium.com/@equiman/net-core-unit-test-and-code-coverage-with-visual-studio-code-1a384b462c5f>.
Also, coverlet documentation here: <https://github.com/tonerdo/coverlet/>.
