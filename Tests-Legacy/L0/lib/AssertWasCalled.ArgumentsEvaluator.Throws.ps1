[cmdletbinding()]
param()

# Arrange.
. $PSScriptRoot\..\..\lib\Initialize-Test.ps1
Register-Mock Invoke-SomeCommand
Invoke-SomeCommand -Param1 Value1 -Param2 Value2

# Act / Assert throws.
Assert-Throws {
        Assert-WasCalled Invoke-SomeCommand -ArgumentsEvaluator {
            $args.Length -eq 4 -and
            $args[0] -eq '-Param1' -and
            $args[1] -eq 'Value1' -and
            $args[2] -eq '-Param2' -and
            $args[3] -eq 'Different value'
        }
    }