# Ensures you do not inherit an AzContext in your runbook
Disable-AzContextAutosave -Scope Process

$connection = Get-AutomationConnection -Name AzureRunAsConnection

while(!($connectionResult) -and ($logonAttempt -le 10))
{
    $LogonAttempt++
    # Logging in to Azure...
    $connectionResult = Connect-AzAccount `
                            -ServicePrincipal `
                            -Tenant $connection.TenantID `
                            -ApplicationId $connection.ApplicationID `
                            -CertificateThumbprint $connection.CertificateThumbprint

    Start-Sleep -Seconds 30
}

$rgname = "PowerShell-lab"
$location = "East US"
New-AzResourceGroup -Name $rgname -Location $location

New-AzResourceGroupDeployment -Name Testdeploy -ResourceGroupName $rgname `
-TemplateParameterUri "https://raw.githubusercontent.com/patn237/Deploy-Azure-Computer-Lab/master/vm-01_parameters.json" `
-TemplateUri "https://raw.githubusercontent.com/patn237/Deploy-Azure-Computer-Lab/master/vm-01_template.json"

New-AzResourceGroupDeployment -Name Testdeploy -ResourceGroupName $rgname `
-TemplateParameterUri "https://raw.githubusercontent.com/patn237/Deploy-Azure-Computer-Lab/master/vm-02_parameters.json" `
-TemplateUri "https://raw.githubusercontent.com/patn237/Deploy-Azure-Computer-Lab/master/vm-02_template.json"

