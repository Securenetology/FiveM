#FiveM - Clear Cache - Logs - Crashes
#Created 12042023 by Zhane Dax
#Version 2.0 - Z. Dax 12052023
#Updated 10202024 Z. Dax

#Elevate as Administrator
# Get the ID and security principal of the current user account
 $myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
 $myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)

 # Get the security principal for the Administrator role
 $adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator

 # Check to see if we are currently running "as Administrator"
 if ($myWindowsPrincipal.IsInRole($adminRole))
    {
    # We are running "as Administrator" - so change the title and background color to indicate this
    $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
    $Host.UI.RawUI.BackgroundColor = "DarkBlue"
    clear-host
    }
 else
    {
    # We are not running "as Administrator" - so relaunch as administrator

    # Create a new process object that starts PowerShell
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";

    # Specify the current script path and name as a parameter
    $newProcess.Arguments = $myInvocation.MyCommand.Definition;

    # Indicate that the process should be elevated
    $newProcess.Verb = "runas";

    # Start the new process
    [System.Diagnostics.Process]::Start($newProcess);

    # Exit from the current, unelevated, process
    exit
    }

#FiveM - Clear Cache - Logs - Crashes

function Execute {
#Remove Client Cache
Remove-Item $env:LOCALAPPDATA\FiveM\FiveM.app\data\cache  -Recurse -Force

#Remove Server Cache
Remove-Item $env:LOCALAPPDATA\FiveM\FiveM.app\data\server-cache  -Recurse -Force

#Remove Crashes
Remove-Item $env:LOCALAPPDATA\FiveM\FiveM.app\crashes  -Recurse -Force

#Remove Logs
Remove-Item $env:LOCALAPPDATA\FiveM\FiveM.app\logs  -Recurse -Force
}

Execute

Write-Host -NoNewLine "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

