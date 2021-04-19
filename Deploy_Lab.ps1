Connect-AzAccount
$rgname = "PowerShell-lab"
$location = "East US"
New-AzResourceGroup -Name $rgname -Location $location

New-AzResourceGroupDeployment -Name Testdeploy -ResourceGroupName $rgname -TemplateFile "C:\Users\Patrick\Documents\Microsoft\PowerShell Learning\Deploy Computer Lab\vm-01_template.json" -TemplateParameterFile "C:\Users\Patrick\Documents\Microsoft\PowerShell Learning\Deploy Computer Lab\vm-01_parameters.json"

New-AzResourceGroupDeployment -Name Testdeploy -ResourceGroupName $rgname -TemplateFile "C:\Users\Patrick\Documents\Microsoft\PowerShell Learning\Deploy Computer Lab\vm-02_template.json" -TemplateParameterFile "C:\Users\Patrick\Documents\Microsoft\PowerShell Learning\Deploy Computer Lab\vm-02_parameters.json"