# MSBuild SDKs

MSBuild SDKs are used to configure and extend your build. MSBuild 15.0 introduced a concept of an SDK which is an upgraded project XML Schema that we commonly refer as 'SDK-style' project.

## Available SDKs

[![MSBuild-SDKs](https://img.shields.io/badge/msbuild--sdks-myget-brightgreen.svg)](https://myget.org/gallery/msbuild-sdks)

### [MSBuild.Core.Sdk](Source/MSBuild.Core.Sdk)

Supports projects that do not compile to an assembly. This is usually the base SDK for other SDKs listed here.

### [MSBuild.Native.Sdk](Source/MSBuild.Native.Sdk)

Supports [Native](Support.md#native-platform-support) projects that include C/C++ (CLang, GCC, VisualC), ASM, FORTRAN, etc.

### [MSBuild.NET.Sdk](Source/MSBuild.NET.Sdk)

Supports [.NET Platform](Support.md#net-platform-support) projects that include building for .NET Framework (Windows), .NET Core (Windows, Linux, MacOS), .NET Mono (Xamarin) runtimes.

### [MSBuild.NET.Extras.Sdk](Source/MSBuild.NET.Extras.Sdk)

Adds a few extra extensions to the SDK-style projects that are currently not available in `Microsoft.NET.Sdk` SDK. This feature is being tracked in [dotnet/sdk#491](/dotnet/sdk/issues/491)

[![MSBuild.NET.Extras.Sdk](https://img.shields.io/nuget/v/MSBuild.NET.Extras.Sdk.svg)](https://nuget.org/packages/MSBuild.NET.Extras.Sdk)
[![MSBuild.NET.Extras.Sdk](https://img.shields.io/myget/msbuild-sdks/v/MSBuild.NET.Extras.Sdk.svg)](https://myget.org/feed/msbuild-sdks/package/nuget/MSBuild.NET.Extras.Sdk)

### [MSBuild.Extras.Sdk](Source/MSBuild.Extras.Sdk)

- [__PackageCentral__](Source/MSBuild.Extras.Sdk/Extras/PackageCentral)

  Supports centrally managing NuGet package versions in a code base. Also allows adding global package references to all projects.

- [__Traversal__](Source/MSBuild.Extras.Sdk/Extras/Traversal)

  Supports creating traversal projects which are MSBuild projects that indicate what projects to include when building your tree. For large project trees, they are replacements for Visual Studio solution files.

- [__VersionInfo__](Source/MSBuild.Extras.Sdk/Extras/VersionInfo)

  Supports centrally managing NuGet package versions in a code base. Also allows adding global package references to all projects.

## Working

An MSBuild SDK, in a nutshell, is a packaged and versioned set of MSBuild tasks, props and targets that offer a specific set of functionalities to any project/solution build.

These SDK-style projects looks like:

```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>net46</TargetFramework>
  </PropertyGroup>
</Project>
```

At evaluation time, MSBuild adds implicit imports at the top and bottom of the project like this:

```xml
<Project>
  <Import Project="Sdk.props" Sdk="Microsoft.NET.Sdk" />

  <PropertyGroup>
    <TargetFramework>net46</TargetFramework>
  </PropertyGroup>

  <Import Project="Sdk.targets" Sdk="Microsoft.NET.Sdk" />
</Project>
```

By default, MSBuild requires that the SDKs must be installed prior to using them. But, for MSBuild 15.6 and above, the SDKs can be referenced as NuGet packages instead.
More documentation is available [here](https://docs.microsoft.com/visualstudio/msbuild/how-to-use-project-sdk).

## Contributing (`TBA`)
