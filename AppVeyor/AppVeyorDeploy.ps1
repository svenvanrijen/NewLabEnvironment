#---------------------------------# 
# Header                          # 
#---------------------------------# 
Write-Host 'Running AppVeyor deploy script' -ForegroundColor Yellow

#---------------------------------# 
# Update module manifest          # 
#---------------------------------# 
if ($env:APPVEYOR_REPO_BRANCH -notmatch 'master')
{
    Write-Host "Finished testing of branch: $env:APPVEYOR_REPO_BRANCH - Exiting"
    exit;
}


#---------------------------------# 
# Publish to PS Gallery           # 
#---------------------------------# 
$ModulePath = Split-Path $pwd
Write-Host "Adding $ModulePath to 'psmodulepath' PATH variable"
$env:psmodulepath = $env:psmodulepath + ';' + $ModulePath

Write-Host 'Publishing module to Powershell Gallery'
#Uncomment the below line, make sure you set the variables in appveyor.yml
Publish-Module -Name $env:ModuleName -NuGetApiKey $env:NuGetApiKey