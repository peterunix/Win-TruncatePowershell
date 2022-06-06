function Truncate-Powershell{
    param(
        [Parameter(Mandatory=$true)][string]$FileName
    )

    $Filename=Resolve-Path "$Filename"
    $Base64 = [System.Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes([System.IO.File]::ReadAllText("$FileName")))

    Write-Host "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -EncodedCommand `"$Base64`""
    "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -EncodedCommand `'$Base64`'" | & "C:\Windows\System32\clip.exe"
    Write-Host "`nCommand copied to clipboard"
}