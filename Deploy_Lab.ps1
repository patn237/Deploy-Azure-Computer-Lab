Connect-AzAccount
New-AzResourceGroup -Name "PowerShell-lab" -Location "East US"

New-AzResourceGroupDeployment -Name Testdeploy -ResourceGroupName PowerShell-lab -TemplateFile "C:\Users\Patrick\Documents\Microsoft\PowerShell Learning\Deploy Computer Lab\vm-01_template.json" -TemplateParameterFile "C:\Users\Patrick\Documents\Microsoft\PowerShell Learning\Deploy Computer Lab\vm-01_parameters.json"

New-AzResourceGroupDeployment -Name Testdeploy -ResourceGroupName PowerShell-lab -TemplateFile "C:\Users\Patrick\Documents\Microsoft\PowerShell Learning\Deploy Computer Lab\vm-02_template.json" -TemplateParameterFile "C:\Users\Patrick\Documents\Microsoft\PowerShell Learning\Deploy Computer Lab\vm-02_parameters.json"