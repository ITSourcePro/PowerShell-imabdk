function Connect-ConfigMgr {

    #
    # Press 'F5' to run this script. Running this script will load the ConfigurationManager
    # module for Windows PowerShell and will connect to the site.
    #
    # This script was auto-generated at '18-11-2020 11:55:04'.

    # Uncomment the line below if running in an environment where script signing is 
    # required.
    #Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

    # Site configuration
    $SiteCode = "KR1" # Site code 
    $ProviderMachineName = "florida.interntnet.dk" # SMS Provider machine name

    # Customizations
    $initParams = @{}
    #$initParams.Add("Verbose", $true) # Uncomment this line to enable verbose logging
    #$initParams.Add("ErrorAction", "Stop") # Uncomment this line to stop the script on any errors

    # Do not change anything below this line

    # Import the ConfigurationManager.psd1 module 
    if((Get-Module ConfigurationManager) -eq $null) {
        Import-Module "$($ENV:SMS_ADMIN_UI_PATH)\..\ConfigurationManager.psd1" @initParams 
    }

    # Connect to the site's drive if it is not already present
    if((Get-PSDrive -Name $SiteCode -PSProvider CMSite -ErrorAction SilentlyContinue) -eq $null) {
        New-PSDrive -Name $SiteCode -PSProvider CMSite -Root $ProviderMachineName @initParams
    }

    # Set the current location to be the site code.
    Set-Location "$($SiteCode):\" @initParams
}

$psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Add("Connect-ConfigMgr", 
{
    Connect-ConfigMgr
},"ALT+F1")