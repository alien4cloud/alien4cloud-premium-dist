if DEFINED JAVA_HOME (
  @set JAVA=%JAVA_HOME%\bin\java
)

if "%JAVA%" =="" (
  echo "Cannot find java. Set JAVA_HOME or add java to path."
  exit 1
)

if "%JAVA_OPTIONS%" =="" (
  @set JAVA_OPTIONS=-server -showversion -Xmx2g -Xms2g -XX:+HeapDumpOnOutOfMemoryError -XX:+UseG1GC -XX:InitiatingHeapOccupancyPercent=75 -XX:-G1UseAdaptiveIHOP -XX:+ScavengeBeforeFullGC -XX:+DisableExplicitGC
)
@set JAVA_OPTIONS=%JAVA_OPTIONS% -Dlog4j.configurationFile=log4j2.xml --illegal-access=warn

cd "%~dp0"
"%JAVA%" %JAVA_OPTIONS% -cp config/;alien4cloud-premium-ui-${project.version}.war org.springframework.boot.loader.WarLauncher %@
