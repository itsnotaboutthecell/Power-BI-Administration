$m = "MSOnline"

if (Get-Module | Where-Object {$_.Name -eq $m}) {
    write-host "Module $m is already imported."
} 
else {
    Install-Module -Name $m -Force -Verbose -Scope CurrentUser
    Import-Module $m -Verbose
}

Connect-MsolService
$licenseType = "Power_BI_Pro", "Power_BI_Standard"
$allUsers = Get-MsolUser -All | where {$_.isLicensed -eq "True"}

foreach ($license in $licenseType) {

    $Licenses = $allUsers | Where-Object {($_.licenses).AccountSkuId -match ($license)} | select objectId, WhenCreated, SignInName , displayName, Title, City, State, Country

    Write-Host "Now Exporting Report: $($license)"
    $Licenses | Export-Csv -Path "C:\Power BI\$($license)_$(Get-Date -Format "yyyyMMdd").csv" -NoTypeInformation

}
