[cmdletbinding()]
param()

# Arrange.
. $PSScriptRoot\..\..\lib\Initialize-Test.ps1

Register-Mock InvokeVsTestCmdletHasMember { return $true } -- -memberName "DiagFileName"
Register-Mock Get-ChildItem { $true } -- -path 'env:system_debug' -erroraction silent

$vstestVersion = "16"
Register-Mock SetRegistryKeyForParallel { } -- -vsTestVersion $vstestVersion 
$path="$env:VS140COMNTools\..\IDE\CommonExtensions\Microsoft\TestWindow\TE.TestModes.dll"
Register-Mock Test-Path { $true } -- -Path $path

. $PSScriptRoot\..\..\..\Tasks\VsTestV1\Helpers.ps1
$enableDiag = ShouldAddDiagFlag $vstestVersion
Assert-AreEqual $true $enableDiag