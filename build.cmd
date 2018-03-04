@echo Off

REM Set Root Path
set WD=%~dp0

REM Check MyGet
if not "%BuildRunner%" == "MyGet" (
	set PackageVersion=%1

	REM Enable VS DevEnv
	call vsdevcmd -no_logo -arch=amd64 -host_arch=amd64
	set MSBuildSDKsPath=%MSBuildSDKsPathNew%
) else (
	set MSBuildSDKsPath=%WD%
)

REM Set Vars
:: set Project=%WD%MSBuild.Sdks.sln
set Project=%WD%Source\MSBuild.NET.Extras.Sdk\MSBuild.NET.Extras.Sdk.nuproj

set Configuration=Release

set version=
if not "%PackageVersion%" == "" (
	set version=;PackageVersion=%PackageVersion%
)

REM Build
call msbuild %Project% /t:Restore;Build /p:Configuration=%Configuration%%version%

REM Check MyGet
if not "%BuildRunner%" == "MyGet" (
	REM Push Package
	call nuget push %WD%Packages\%Configuration%\*.nupkg
)