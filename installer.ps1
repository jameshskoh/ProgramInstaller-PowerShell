# Requires -RunAsAdministrator

Set-ExecutionPolicy Bypass -Scope Process -Force

$file = Read-Host -Prompt 'Please input your package list name.'
Write-Host $PSScriptRoot
$file = $PSScriptRoot + "\\" + $file

# install chocolatey if not installed
if (!(Test-Path -Path "$env:ProgramData\Chocolatey")) {
    Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
    # for each package in the list run install
    foreach($line in Get-Content $file) {
        choco install -y $line
    }
}
