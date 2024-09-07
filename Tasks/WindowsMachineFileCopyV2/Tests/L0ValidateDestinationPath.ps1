[CmdletBinding()]
param()

. $PSScriptRoot\..\..\..\Tests\lib\Initialize-Test.ps1
. $PSScriptRoot\MockVariable.ps1 -Force

. $PSScriptRoot\..\Utility.ps1

Assert-Throws {
   Validate-DestinationPath -value "" -environmentName $validEnvironmentName
} -Message "WFC_ParameterCannotBeNullorEmpty targetPath"

Assert-Throws {
    Validate-DestinationPath -value $invalidTargetPath -environmentName $validEnvironmentName
} -Message "WFC_RemoteDestinationPathCannotContainEnvironmentVariables `$env:abc\123"
