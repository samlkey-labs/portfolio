param emailServiceName string
param communicationServiceName string

@description('Where ACS stores data at rest.')
param dataLocation string
param tags object

resource emailService 'Microsoft.Communication/emailServices@2023-04-01' = {
  name: emailServiceName
  location: 'global'
  tags: tags
  properties: {
    dataLocation: dataLocation
  }
}

// Azure-managed sender domain (DoNotReply@<guid>.azurecomm.net), no DNS setup needed
resource emailDomain 'Microsoft.Communication/emailServices/domains@2023-04-01' = {
  parent: emailService
  name: 'AzureManagedDomain'
  location: 'global'
  tags: tags
  properties: {
    domainManagement: 'AzureManaged'
    userEngagementTracking: 'Disabled'
  }
}

resource communicationService 'Microsoft.Communication/communicationServices@2023-04-01' = {
  name: communicationServiceName
  location: 'global'
  tags: tags
  properties: {
    dataLocation: dataLocation
    linkedDomains: [
      emailDomain.id
    ]
  }
}

output communicationServiceName string = communicationService.name
output senderAddress string = 'DoNotReply@${emailDomain.properties.mailFromSenderDomain}'
