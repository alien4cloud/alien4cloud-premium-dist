if DEFINED JAVA_HOME (
  @set JAVA=%JAVA_HOME%\bin\java
)

if "%JAVA%" =="" (
  echo "Cannot find java. Set JAVA_HOME or add java to path."
  exit 1
)

if "%JAVA_OPTIONS%" =="" (
  @set JAVA_OPTIONS=-server -showversion -XX:+AggressiveOpts -Xmx2g -Xms2g -XX:MaxPermSize=512m -XX:+HeapDumpOnOutOfMemoryError -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -XX:+ScavengeBeforeFullGC -XX:+CMSScavengeBeforeRemark -XX:+DisableExplicitGC
)

cd "%~dp0"
"%JAVA%" %JAVA_OPTIONS% -cp config/;lib/*;alien4cloud-ui-${project.version}.war org.springframework.boot.loader.WarLauncher %@
