# dotnet-sonar

This is a container used to build dotnet projects and provide SonarQube analysis using SonarQube MSBuild Scanner.

It also allows you to run Docker in Docker using a docker.sock mount.

----

This latest image was built with the following components:

* dotnetcore-sdk 8.0.303
* dotnetcore-runtime 8.0.7 (required by Sonar-Scanner)
* SonarQube MSBuild Scanner 7.1.1.96069
* Docker binaries 24.0.x (for running Docker in Docker using the docker.sock mount)
* OpenJDK Java Runtime 17 (required by Sonar-Scanner and some Sonar-Scanner plugins)
* NodeJS 20 (required by Sonar-Scanner web analysis plugins)

## Supported tags and respective `Dockerfile` links

> Tags are written using the following pattern: `dotnet-sonar:<year>.<month>.<revision>`

* `24.07.5`, `latest8`, `latest`, `24.07-dotnet8` [(24.07.5/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/24.07.5/Dockerfile)
  * DotNet 8.0.303
  * SonarScanner 7.1.1.96069
* `24.08.3`, `latest6`, `24.08-dotnet6` [(24.08.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/24.08.3/Dockerfile)
  * DotNet 6.0.424
  * SonarScanner 7.1.1.96069
> :warning: **[(THIS VERSION HAS REACHED END OF LIFE)](https://dotnet.microsoft.com/en-us/download/dotnet/7.0)**
* `24.05.4`, `latest7`, `24.05-dotnet7` [(24.05.4/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/24.05.4/Dockerfile)
  * DotNet 7.0.409
  * SonarScanner 6.2.0.85879
> :warning: **[(THIS VERSION HAS REACHED END OF LIFE)](https://dotnet.microsoft.com/en-us/download/dotnet/5.0)**
* `22.07.1`, `latest5` [(22.07.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.07.1/Dockerfile)
  * DotNet 5.0.408
  * SonarScanner 5.7.1.49528
* `24.07.3` [(24.07.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/24.07.3/Dockerfile)
* `24.06.5` [(24.06.5/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/24.06.5/Dockerfile)
* `24.06.3` [(24.06.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/24.06.3/Dockerfile)
* `24.05.5` [(24.05.5/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/24.05.5/Dockerfile)
* `24.05.3` [(24.05.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/24.05.3/Dockerfile)
* `24.02.5` [(24.02.5/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/24.02.5/Dockerfile)
* `24.02.4` [(24.02.4/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/24.02.4/Dockerfile)
* `24.02.3` [(24.02.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/24.02.3/Dockerfile)
* `24.01.5` [(24.01.5/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/24.01.5/Dockerfile)
* `24.01.4` [(24.01.4/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/24.01.4/Dockerfile)
* `24.01.3` [(24.01.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/24.01.3/Dockerfile)
* `23.12.5` [(23.12.5/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.12.5/Dockerfile)
* `23.12.4` [(23.12.4/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.12.4/Dockerfile)
* `23.12.3` [(23.12.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.12.3/Dockerfile)
* `23.10.4` [(23.10.4/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.10.4/Dockerfile)
* `23.10.3` [(23.10.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.10.3/Dockerfile)
* `23.09.4` [(23.09.4/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.09.4/Dockerfile)
* `23.09.3` [(23.09.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.09.3/Dockerfile)
* `23.08.4` [(23.08.4/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.08.4/Dockerfile)
* `23.08.3` [(23.08.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.08.3/Dockerfile)
* `23.06.4` [(23.06.4/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.06.4/Dockerfile)
* `23.06.3` [(23.06.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.06.3/Dockerfile)
* `23.02.4` [(23.02.4/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.02.4/Dockerfile)
* `23.02.3` [(23.02.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.02.3/Dockerfile)
* `22.12.4` [(22.12.4/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.12.4/Dockerfile)
* `22.12.3` [(22.12.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.12.3/Dockerfile)
* `22.11.4` [(22.11.4/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.11.4/Dockerfile)
* `22.11.3` [(22.11.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.11.3/Dockerfile)
* `22.10.3` [(22.10.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.10.3/Dockerfile)
* `22.07.3` [(22.07.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.07.3/Dockerfile)
* `22.07.0`, `latest31` [(22.07.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.07.0/Dockerfile)
  * DotNetCore 3.1.420
  * SonarScanner 5.7.1.49528
* `21.11.3` [(21.11.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.11.3/Dockerfile)
* `21.11.1` [(21.11.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.11.1/Dockerfile)
* `21.11.0` [(21.11.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.11.0/Dockerfile)
* `21.07.1` [(21.07.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.07.1/Dockerfile)
* `21.07.0` [(21.07.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.07.0/Dockerfile)
* `21.06.1` [(21.06.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.06.1/Dockerfile)
* `21.06.0` [(21.06.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.06.0/Dockerfile)
* `21.05.1` [(21.05.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.05.1/Dockerfile)
* `21.05.0` [(21.05.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.05.0/Dockerfile)
* `21.04.1` [(21.04.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.04.1/Dockerfile)
* `21.04.0` [(21.04.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.04.0/Dockerfile)
* `21.01.1` [(21.01.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.01.1/Dockerfile)
* `21.01.0` [(21.01.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.01.0/Dockerfile)
* `20.12.2` [(20.12.2/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/20.12.2/Dockerfile)
* `20.12.1` [(20.12.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/20.12.1/Dockerfile)
* `20.12.0` [(20.12.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/20.12.0/Dockerfile)
  * DotNetCore 2.2.207
  * SonarScanner 5.0.4.24009
* `20.10.1` [(20.10.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/20.10.1/Dockerfile)
* `20.10.0` [(20.10.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/20.10.0/Dockerfile)
* `20.07.0` [(20.07.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/20.07.0/Dockerfile)
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
$ docker run -it --rm -v <my-project-source-path>:/source ghcr.io/nosinovacao/dotnet-sonar:latest bash -c "cd source \
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
    dotnet-sonar:latest \
    bash -c \
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
        docker.image('ghcr.io/nosinovacao/dotnet-sonar:latest').inside()
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
docker.image('ghcr.io/nosinovacao/dotnet-sonar:latest').inside("--group-add docker -v /var/run/docker.sock:/var/run/docker.sock")
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
