@echo off

:: Read params
set targetBranch=%1
if "%~1" == "" goto target-branch-required
:: 2nd param expected to be -r, -m, or blank
:select-method
echo Would you like to (m)erge or (r)ebase?
set /p methodArg=
if "%methodArg%" == "r" goto rebase
if "%methodArg%" == "m" goto merge
goto select-method

:rebase
set method=rebase
goto checkout
:merge
set method=merge
goto checkout

:: Checkout the target branch and catch it up with remote.
:checkout
echo on
git checkout %targetBranch%
@echo off
if %errorlevel% neq 0 exit /b %errorlevel%
echo on
git fetch
git pull
git checkout -
git %method% %targetBranch%
@exit

:: Error cases
:target-branch-required
    echo Target branch argument is required. Example: "git catchup develop"
    exit /b 1