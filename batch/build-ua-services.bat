@echo off

SET UA_HOME=D:\UA
SET UA_REPO_HOME=D:\UA\source
SET PATH=D:\UA\jdk-11.0.1;D:\UA\jdk-11.0.1\bin;D:\UA\tools\ffmpeg;D:\UA\tools\ffmpeg\bin;%PATH%
SET JAVA_HOME=D:\UA\jdk-11.0.1

:: Starting UA Eureka Discovery Service
ECHO ====================================================================
ECHO Building UA Eureka Discovery Service
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-services\urban-stack-discovery-server
CD %UA_REPO_HOME%\urbanamigo-services\urban-stack-discovery-server
ECHO Current Working directory is %cd%
CALL ..\gradlew bootJar

timeout 2

:: Starting UA API Gateway Service
ECHO ====================================================================
ECHO Building UA API Gateway Service
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-services\urban-stack-api-gateway
CD %UA_REPO_HOME%\urbanamigo-services\urban-stack-api-gateway
ECHO Current Working directory is %cd%
CALL ..\gradlew bootJar

timeout 2


:: Starting UA Account Service
ECHO ====================================================================
ECHO Building UA Account Service
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-services\urban-accounts-service
CD %UA_REPO_HOME%\urbanamigo-services\urban-accounts-service
ECHO Current Working directory is %cd%
CALL ..\gradlew bootJar

timeout 2


:: Starting UA Notification Service
ECHO ====================================================================
ECHO Building UA Notification Service
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-services\urban-notifications-service
CD %UA_REPO_HOME%\urbanamigo-services\urban-notifications-service
ECHO Current Working directory is %cd%
CALL ..\gradlew bootJar

timeout 2


:: Starting UA Videos Service
ECHO ====================================================================
ECHO Building UA Videos Service
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-services\urban-videos-service
CD %UA_REPO_HOME%\urbanamigo-services\urban-videos-service
ECHO Current Working directory is %cd%
CALL ..\gradlew bootJar

timeout 2


:: Starting UA Jobs Service
ECHO ====================================================================
ECHO Building UA Jobs Service
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-services\urban-jobs-service
CD %UA_REPO_HOME%\urbanamigo-services\urban-jobs-service
ECHO Current Working directory is %cd%
CALL ..\gradlew bootJar

PAUSE



