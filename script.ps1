# Gather computer usage and export to CSV
Get-Process | Select-Object Name, CPU, Id |
Export-Csv -Path ".\processes.csv" -NoTypeInformation

# Create directories
$evidence = ".\3-Evidence"
$backup = ".\3-Backup"

New-Item -ItemType Directory -Path $evidence -Force
New-Item -ItemType Directory -Path $backup -Force

# Create sample file
$file = "$evidence\data.txt"
Set-Content -Path $file -Value "Sensitive data"

# Copy content to backup
Copy-Item -Path "$evidence\*" -Destination $backup -Recurse -Force

# Get access control lists
Get-Acl $evidence | Out-File ".\3-Evidence-ACL.txt"
Get-Acl $backup | Out-File ".\3-Backup-ACL.txt"

# Set backup files to read-only
Get-ChildItem -Path $backup -Recurse | ForEach-Object {
    $_.IsReadOnly = $true
}

# Encrypt evidence folder
cipher /E $evidence

# Search file contents
Get-Content $file | Select-String "Sensitive" > ".\search-results.txt"