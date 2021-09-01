# Criar Storage Account do tipo StorageV2 com Locally-redudant storage (LRS)

# Conectar no portal do Azure
Connect-AzAccount

# Variáveis
$resourceGroup = “RG-sto”
$location = “East US”
$stoname = "appstoredev"
$sku = "Standard_LRS"
$containername = "data"

# Criar Resource Group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Criar Storage Account
New-AzStorageAccount -ResourceGroupName $resourceGroup `
-Name $stoname `
-Location $location `
-SkuName $sku  `
-Kind StorageV2

# Criar o Container
$sto=Get-AzStorageAccount $resourceGroup -Name $stoname
$sto=$sto.context
New-AzStorageContainer -Name $containername -Context $sto

# Enviar arquivos para o container
Set-AzStorageBlobContent -File C:\Users\cobaia\Documents\sample.txt `-Container $containername -Blob sample.txt -Context $sto