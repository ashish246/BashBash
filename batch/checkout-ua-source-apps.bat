@ECHO OFF

SET UA_HOME=D:\UA
SET UA_REPO_HOME=D:\UA\source


:: Updating repository D:\UA\SOURCE\urbanamigo-admin
ECHO ================================================================
ECHO Updating repository %UA_REPO_HOME%\urbanamigo-admin
ECHO ================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-admin
CD %UA_REPO_HOME%\urbanamigo-admin
ECHO Current Working directory is %cd%
ECHO Current local git branch is
CALL git branch
ECHO Pulling data from Git Remote repository \urbanamigo-admin
CALL git pull
ECHO Current Working directory is %cd%
ECHO Pulling data from Git submodule repository \lib-angular-shared
CALL git submodule update --init --recursive

timeout 2


:: Updating repository D:\UA\SOURCE\urbanamigo-employer-web
ECHO ================================================================
ECHO Updating repository %UA_REPO_HOME%\urbanamigo-employer-web
ECHO ================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-employer-web
CD %UA_REPO_HOME%\urbanamigo-employer-web
ECHO Current Working directory is %cd%
ECHO Current local git branch is
CALL git branch
ECHO Pulling data from Git Remote repository \urbanamigo-employer-web
CALL git pull
ECHO Current Working directory is %cd%
ECHO Pulling data from Git submodule repository \lib-angular-shared
CALL git submodule update --init --recursive

timeout 2


:: Updating repository D:\UA\SOURCE\urbanamigo-web
ECHO ==============================================================
ECHO Updating repository %UA_REPO_HOME%\urbanamigo-web
ECHO ==============================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-web
CD %UA_REPO_HOME%\urbanamigo-web
ECHO Current Working directory is %cd%
ECHO Current local git branch is
CALL git branch
ECHO Pulling data from Git Remote repository \urbanamigo-web
CALL git pull
ECHO Current Working directory is %cd%
ECHO Pulling data from Git submodule repository \lib-angular-shared
CALL git submodule update --init --recursive

timeout 2



:: Updating repository D:\UA\SOURCE\urbanamigo-jobs-app
ECHO ==============================================================
ECHO Updating repository %UA_REPO_HOME%\urbanamigo-jobs-app
ECHO ==============================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-jobs-app
CD %UA_REPO_HOME%\urbanamigo-jobs-app
ECHO Current Working directory is %cd%
ECHO Current local git branch is
CALL git branch
ECHO Pulling data from Git Remote repository \urbanamigo-jobs-app 
CALL git pull
ECHO Current Working directory is %cd%
ECHO Pulling data from Git submodule repository \lib-angular-shared
CALL git submodule update --init --recursive

PAUSE