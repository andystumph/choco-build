
# Requires -Version 5.1
# Requires -RunAsAdministrator

[CmdletBinding(SupportsShouldProcess=$True)]

param (
    [Parameter(Mandatory=$False,Position=0)]
	[ValidateNotNullOrEmpty()]
	[String[]]
	$Applications = @("7zip","Notepadplusplus","SysInternals","WinSCP","Putty","Packer","Kubernetes-cli","Kubernetes-helm","Nodejs","Python","K9s","Git","Terraform","Greenshot","Bicep","Rancher-Desktop","Microsoft-Windows-Terminal","OpenLens","PoshGit","Oh-My-Posh","Slack","Azure-cli","AZ.PowerShell","dotnet","PowerShell-Core","VSCode","NuGet.CommandLine")
)

try {
    choco --version
} catch {
    Write-Host -ForegroundColor Yellow -Object "Chocolatey was not found. Attempting to install..."
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
    Invoke-Expression -Command ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

foreach ($App in $Applications) {
    Write-Host -ForegroundColor Green "Installing $($App)..."
    & choco.exe install $App /y
}


