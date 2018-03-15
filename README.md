# dotnet-sonar

This is a container used to build dotnet projects and provide SonarQube analysis using SonarQube MSBuild Scanner.

This image was built with the following components:

* dotnet-sdk-2 (jessie)
* Oracle Java 8
* Mono developer
* SonarQube MSBuild Scanner 4.0.2
* Docker binaries 17.06.2

## Tags

Tags are written using the following pattern: `dotnet-sonar:<year>.<month>.<revision>`

* dotnet-sonar:18.03.0
* dotnet-sonar:2-4.0.2

## Compiling dotnet code with SonarQube Analysis

Based on this guide: <https://docs.sonarqube.org/display/SCAN/Scanning+on+Linux+or+macOS>

```bash
docker run -it --rm -v <my-project-source-path>:/source dotnet-sonar bash -c "cd source \
&& mono /sonar-scanner/SonarQube.Scanner.MSBuild.exe begin /d:sonar.host.url=<sonar-url> /d:sonar.login=login /d:sonar.password=password /k:my-project-key \
&& dotnet restore \
&& dotnet build -c Release \
&& mono /sonar-scanner/SonarQube.Scanner.MSBuild.exe end /d:sonar.login=login /d:sonar.password=password"
```