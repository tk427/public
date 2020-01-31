<#
.SYNOPSIS
    Examples Aliases in a PowerShell Session    
    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 08/05/2019 09:37 AM 
    Code Version    : 20190805-1
    
.DESCRIPTION
    Examples Aliases in a PowerShell Session you can set to be used during a PowerShell session.

.NOTES
#>

# Maps "ifconfig" to the ipconfig alais
set-alias ifconfig ipconfig

# Launch the RemoteCMD powershell script to open a powershell command prompt on a remote computer
set-alias remote ./remotecmd.ps1

# Type "view <filename.ext>" and the file will open with it's default applcation
set-alias view Start-Process

# Type "edit <filename.ext>" and the file will open with Notepad
set-alias edit Notepad

# Displays how long until retirement
set-alias retirement C:\code\PowershellScripts\Dev\Retirement.ps1

# Exchange Remote PowerShell Console
set-alias Exchange-Console C:\code\PowershellScripts\Exchange\ExchangeShell.ps1

# Flush DNS Cache
set-alias FLushDNS Clear-DnsClientCache
