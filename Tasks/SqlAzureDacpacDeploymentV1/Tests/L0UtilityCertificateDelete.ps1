[CmdletBinding()]
param()

. $PSScriptRoot\..\..\..\Tests\lib\Initialize-Test.ps1
. $PSScriptRoot\MockVariable.ps1

#path to Utility.ps1 for SqlAzureDacpacDeployment task
. "$PSScriptRoot\..\Utility.ps1"

Register-Mock Remove-AzureSqlDatabaseServerFirewallRule { throw "Invalid Firewall Rule provided" } -ParametersEvaluator { $firewallRuleName -eq $invalidfirewallRuleName }
Register-Mock Remove-AzureSqlDatabaseServerFirewallRule { } -ParametersEvaluator { $firewallRuleName -eq $certificateFirewallRuleName }

Assert-Throws {
    Delete-AzureSqlDatabaseServerFirewallRule -serverName $azureSqlServerName -firewallRuleName $invalidfirewallRuleName `
                                                        -endpoint $usernameEndpoint -deleteFireWallRule $true -isFirewallConfigured $true 
} -MessagePattern "Invalid Firewall Rule provided"

#should not throw
Delete-AzureSqlDatabaseServerFirewallRule -serverName $azureSqlServerName -firewallRuleName $certificateFirewallRuleName `
                                                        -endpoint $usernameEndpoint -deleteFireWallRule $true -isFirewallConfigured $true