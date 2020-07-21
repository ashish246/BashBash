@ECHO OFF

SET UA_HOME=D:\UA
SET UA_REPO_HOME=D:\UA\source

:: Updating repository D:\UA\SOURCE\urbanamigo-services
ECHO ================================================================
ECHO Updating repository %UA_REPO_HOME%\urbanamigo-services
ECHO ================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-services
CD %UA_REPO_HOME%\urbanamigo-services
ECHO Current Working directory is %cd%
ECHO Current local git branch is
CALL git branch
ECHO Pulling data from Git Remote repository \urbanamigo-services
CALL git pull
ECHO Current Working directory is %cd%
ECHO Pulling data from Git submodule repository \urban-lib-common
CALL git submodule update --init --recursive


PAUSE