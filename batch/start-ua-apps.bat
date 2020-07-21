@echo off

SET UA_HOME=D:\UA
SET UA_REPO_HOME=D:\UA\source


:: Starting UA Admin App
ECHO ====================================================================
ECHO Starting UA Admin App at Port - 4201
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-admin
CD %UA_REPO_HOME%\urbanamigo-admin
ECHO Current Working directory is %cd%
start cmd -new_console:n:t:Admin /k ng serve --open

timeout 2


:: Starting UA Employer Web App
ECHO ====================================================================
ECHO Starting UA Employer Web App at Port - 4202
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-employer-web
CD %UA_REPO_HOME%\urbanamigo-employer-web
ECHO Current Working directory is %cd%
start cmd -new_console:s1TVn:t:Employer /k ng serve --open

timeout 2


:: Starting UA Web App
ECHO ====================================================================
ECHO Starting UA Web App at Port - 4200
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-web
CD %UA_REPO_HOME%\urbanamigo-web
ECHO Current Working directory is %cd%
start cmd -new_console:s1THn:t:Web /k ng serve --open

timeout 2


:: Starting UA Jobs Mobile App
ECHO ====================================================================
ECHO Starting UA Jobs Mobile App at Port - 4203
ECHO ====================================================================
ECHO Change Directory to %UA_REPO_HOME%\urbanamigo-jobs-app
CD %UA_REPO_HOME%\urbanamigo-jobs-app
ECHO Current Working directory is %cd%
start cmd -new_console:s2THnt:MobileJobs /k npm run serve:local

PAUSE