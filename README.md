# df-mod3-sdm

## Overview
This project demonstrates Secure Data Management (SDM) using PowerShell. It includes file management, permissions handling, encryption, and scripting to protect data integrity, confidentiality, and availability.

---

## Secure Data Management (SDM)

### File & Folder Commands Used
```powershell
# Create directory
New-Item -ItemType Directory -Path .\3-Evidence

# Create a sample file
Set-Content -Path .\3-Evidence\log.txt -Value "Sample evidence data"

# Copy folder to backup
Copy-Item -Path .\3-Evidence -Destination .\3-Backup -Recurse

# Get ACL and export
Get-Acl .\3-Evidence | Out-File .\3-Evidence-ACL.txt