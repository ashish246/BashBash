@echo off

SET UA_HOME=D:\UA
SET UA_REPO_HOME=D:\UA\source
SET PATH=D:\UA\jdk-11.0.1;D:\UA\jdk-11.0.1\bin;D:\UA\tools\ffmpeg;D:\UA\tools\ffmpeg\bin;%PATH%
SET JAVA_HOME=D:\UA\jdk-11.0.1


:: Starting UA Admin App
ECHO ====================================================================
ECHO Building UA Admin App
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-admin
CD %UA_REPO_HOME%\urbanamigo-admin
ECHO Current Working directory is %cd%
CALL ng build

timeout 2


:: Starting UA Employer Web App
ECHO ====================================================================
ECHO Building UA Employer Web App
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-employer-web
CD %UA_REPO_HOME%\urbanamigo-employer-web
ECHO Current Working directory is %cd%
CALL ng build

timeout 2


:: Starting UA Web App
ECHO ====================================================================
ECHO Building UA Web App
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-web
CD %UA_REPO_HOME%\urbanamigo-web
ECHO Current Working directory is %cd%
CALL ng build

timeout 2


:: Building UA Mobile Jobs App
ECHO ====================================================================
ECHO Building UA Jobs Mobile App
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-jobs-app
CD %UA_REPO_HOME%\urbanamigo-jobs-app
ECHO Current Working directory is %cd%
CALL ionic build

PAUSE