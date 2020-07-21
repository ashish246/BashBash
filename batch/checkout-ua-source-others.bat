@ECHO OFF

SET UA_HOME=D:\UA
SET UA_REPO_HOME=D:\UA\source

:: Updating repository D:\UA\SOURCE\meeting-notes
ECHO ====================================================================
ECHO Updating repository %UA_REPO_HOME%\meeting-notes
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\meeting-notes
CD %UA_REPO_HOME%\meeting-notes
ECHO Current Working directory is %cd%
ECHO Current local git branch is
CALL git branch
ECHO Pulling data from Git Remote repository \meeting-notes
CALL git pull

timeout 2


:: Updating repository D:\UA\SOURCE\server-configuration
ECHO ==================================================================
ECHO Updating repository %UA_REPO_HOME%\server-configuration
ECHO ==================================================================
ECHO Change Directory to %UA_REPO_HOME%\server-configuration
CD %UA_REPO_HOME%\server-configuration
ECHO Current Working directory is %cd%
ECHO Current local git branch is
CALL git branch
ECHO Pulling data from Git Remote repository \server-configuration
CALL git pull

timeout 2


:: Updating repository D:\UA\SOURCE\ua-campaign
ECHO =================================================================
ECHO Updating repository %UA_REPO_HOME%\ua-campaign
ECHO =================================================================
ECHO Change Directory to %UA_REPO_HOME%\ua-campaign
CD %UA_REPO_HOME%\ua-campaign
ECHO Current Working directory is %cd%
ECHO Current local git branch is
CALL git branch
ECHO Pulling data from Git Remote repository \ua-campaign
CALL git pull

PAUSE