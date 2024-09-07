[CmdletBinding()]
param()

. $PSScriptRoot\..\..\..\Tests\lib\Initialize-Test.ps1
. $PSScriptRoot\..\Utility.ps1

$invalidSourcePath = "Invalid"
Unregister-Mock Test-Path
Register-Mock Test-Path { return $false } -ParametersEvaluator { $LiteralPath -eq $invalidSourcePath }

Assert-Throws {
    Validate-SourcePath -value ""
} -MessagePattern "WFC_ParameterCannotBeNullorEmpty sourcePath"

Assert-Throws {
    Validate-SourcePath -value "$invalidSourcePath"
} -MessagePattern "WFC_SourcePathDoesNotExist Invalid"