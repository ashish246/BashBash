@echo off

SET CON_EMU_DIR=C:\Program Files\ConEmu
SET UA_JAVA_HOME=D:\UA\jdk-11.0.1
SET UA_HOME=D:\UA
SET UA_MINIO_HOME=D:\UA\tools\minio
SET UA_REPO_HOME=D:\UA\source
SET UA_SERVICE_HOME=D:\UA\source\urbanamigo-services

ECHO ====================================================================
ECHO Starting Minio Server at Port - 9000 
ECHO ====================================================================
start cmd -new_console:t:Minio /k %UA_MINIO_HOME%\minio.exe server D:\UA\ua-minio
timeout 10

ECHO ====================================================================
ECHO Starting Discovery Service at Port - 8761
ECHO ====================================================================
start cmd -new_console:t:Discovery /k %UA_JAVA_HOME%\bin\java.exe -jar %UA_SERVICE_HOME%\urban-stack-discovery-server\build\libs\urban-stack-discovery-server-%1.jar
timeout 20

ECHO ====================================================================
ECHO Starting API Gateway Service at Port - 8080
ECHO ====================================================================
start cmd -new_console:t:Gateway /k %UA_JAVA_HOME%\bin\java.exe -jar %UA_SERVICE_HOME%\urban-stack-api-gateway\build\libs\urban-stack-api-gateway-%1.jar
timeout 20

ECHO ====================================================================
ECHO Starting Account Service at Port - 8100
ECHO ====================================================================
start cmd -new_console:t:Accounts /k %UA_JAVA_HOME%\bin\java.exe -jar %UA_SERVICE_HOME%\urban-accounts-service\build\libs\urban-accounts-service-%1.jar
timeout 2

ECHO ====================================================================
ECHO Starting Jobs Service at Port - 8120
ECHO ====================================================================
start cmd -new_console:t:Jobs /k %UA_JAVA_HOME%\bin\java.exe -jar %UA_SERVICE_HOME%\urban-jobs-service\build\libs\urban-jobs-service-%1.jar
timeout 2

ECHO ====================================================================
ECHO Starting Notification Service at Port - 8130
ECHO ====================================================================
start cmd -new_console:t:Notification /k %UA_JAVA_HOME%\bin\java.exe -jar %UA_SERVICE_HOME%\urban-notifications-service\build\libs\urban-notifications-service-%1.jar
timeout 2

ECHO ====================================================================
ECHO Starting Video Service at Port - 8140
ECHO ====================================================================
start cmd -new_console:t:Video /k %UA_JAVA_HOME%\bin\java.exe -jar %UA_SERVICE_HOME%\urban-videos-service\build\libs\urban-videos-service-%1.jar

PAUSE