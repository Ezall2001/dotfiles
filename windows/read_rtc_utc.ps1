$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
$keyName = "RealTimeIsUniversal"
$keyValue = 1

if (-not (Test-Path $regPath)) {
    Write-Host "Registry path not found: $regPath"
    exit 1
}

Set-ItemProperty -Path $regPath -Name $keyName -Value $keyValue -Type DWord

