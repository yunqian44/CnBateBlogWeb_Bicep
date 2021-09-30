//targetScope='resourceGroup' Default Deplay Target
param webAppName string = toLower('cnbateblogweb')
param webSiteName string=toLower('${webAppName}-appservice')
param runtime string='.NET 6'
param webAppPlanName string =toLower('${webAppName}-appserviceplan')
param location string = resourceGroup().location // Location for all resources

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: webAppPlanName
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource webApplication 'Microsoft.Web/sites@2018-11-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig:{
      linuxFxVersion:runtime
    }
  }
}
