targetScope='subscription'

//targetScope='resourceGroup' Default Deplay Target
param rg_name string = 'Web_Test_Bicep_RG'
param location string ='EastAsia'
var tags  ={
  'tag': 'create by bicep'   
}
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rg_name
  location: location
  tags:tags
}

output rgname string =rg.name

