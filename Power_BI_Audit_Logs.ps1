<# 
    Refer to examples for using ServicePrincipal in the MS Docs:
    https://docs.microsoft.com/en-us/powershell/module/MicrosoftPowerBIMgmt.Profile/Connect-PowerBIServiceAccount?view=powerbi-ps
#>

Connect-PowerBIServiceAccount # -ServicePrincipal -Credential (Get-Credential)

# Declare Variables
$outPath = "C:\Power BI\Activity Logs\"

# Gets Previous X Days Events – Max Value 89
$offsetDays = 89

############### SCRIPT BEGINS ###############

# Erorr Handling: outPath - Final character is forward slash and folder exists
if ($outPath.Substring($outPath.Length - 1, 1) -cne "\") { $outPath = $outPath + "\" }
if (!(Test-Path $outPath)) { New-Item -ItemType Directory -Force -Path $outPath }

# Iterates Offset Date Range
For ($i = 1; $i -le $offsetDays; $i+=1) { 
    $startEvent = ((Get-Date).AddDays(-$i).ToString("yyyy-MM-ddT00:00:00.000"))
    $endEvent = ((Get-Date).AddDays(-$i).ToString("yyyy-MM-ddT23:59:59.999"))
    
    Write-Host "Evaluating Activity Log: $($startEvent.Substring(0,10))"
    $pbiActivities = Get-PowerBIActivityEvent -StartDateTime $startEvent -EndDateTime $endEvent | ConvertFrom-Json

    if ($pbiActivities.count -ne 0) {
        $outDate = $startEvent.Substring(0,10) -replace '-',''
        $pbiActivities | Export-Csv -Path "$($outpath)Power_BI_Activity_Logs_$($outDate).csv" -NoTypeInformation -Force -Append
    }
}

Disconnect-PowerBIServiceAccount

exit 
