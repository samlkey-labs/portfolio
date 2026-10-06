# Infrastructure

Bicep templates for hosting the portfolio on Azure Static Web Apps.

| File | Purpose |
|---|---|
| `main.bicep` | Subscription-scoped entry point. Deploys the Static Web App into an existing resource group. |
| `modules/staticWebApp.bicep` | The Static Web App, optional custom domain, and API app settings. |
| `modules/communication.bicep` | Azure Communication Services Email, used by the contact form API in `/api`. |
| `main.bicepparam` | Parameter values, including the resource group name. |

The resource group (`slk-portfolio-rg-eus2`) already exists and isn't managed by these templates. The Static Web App is deployed to **East US 2** (West Europe isn't accepting new Static Web Apps for this subscription); its content is served from Azure's global edge network.

Deployment runs from `.github/workflows/slk-portfolio-swa-eus2.yml`: `what-if` on pull requests, `create` on push to `master`.

## One-time setup: GitHub → Azure OIDC

Run these once with the Azure CLI, signed in as someone who can assign roles on the subscription.

```bash
# Git Bash rewrites args starting with "/" into Windows paths, which breaks --scope
export MSYS_NO_PATHCONV=1

# Resource providers the deploy identity can't register itself
az provider register --namespace Microsoft.Web
az provider register --namespace Microsoft.Communication

SUBSCRIPTION_ID=$(az account show --query id -o tsv)
TENANT_ID=$(az account show --query tenantId -o tsv)

APP_ID=$(az ad app create --display-name gh-portfolio-deploy --query appId -o tsv)
az ad sp create --id "$APP_ID"

# Contributor on the resource group, to manage the Static Web App
az role assignment create \
  --assignee "$APP_ID" \
  --role Contributor \
  --scope "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/slk-portfolio-rg-eus2"

# Subscription-scoped deployments also need permission to write deployments at subscription level
az role definition create --role-definition '{
  "Name": "Subscription Deployment Writer",
  "Description": "Create and read subscription-scoped ARM deployments.",
  "Actions": [
    "Microsoft.Resources/deployments/*",
    "Microsoft.Resources/subscriptions/resourceGroups/read",
    "Microsoft.Web/locations/*/read"
  ],
  "AssignableScopes": ["/subscriptions/'"$SUBSCRIPTION_ID"'"]
}'
az role assignment create \
  --assignee "$APP_ID" \
  --role "Subscription Deployment Writer" \
  --scope "/subscriptions/$SUBSCRIPTION_ID"

# GitHub's OIDC subject for this repo includes the owner and repo IDs (owner@id/repo@id).
# The exact value is printed as "subject claim" in the azure/login step of a workflow run.

# Trust pushes to master
az ad app federated-credential create --id "$APP_ID" --parameters '{
  "name": "master",
  "issuer": "https://token.actions.githubusercontent.com",
  "subject": "repo:samlkey-labs@316934009/portfolio@1334097551:ref:refs/heads/master",
  "audiences": ["api://AzureADTokenExchange"]
}'

# Trust pull requests (what-if and preview environments)
az ad app federated-credential create --id "$APP_ID" --parameters '{
  "name": "pull-requests",
  "issuer": "https://token.actions.githubusercontent.com",
  "subject": "repo:samlkey-labs@316934009/portfolio@1334097551:pull_request",
  "audiences": ["api://AzureADTokenExchange"]
}'

echo "AZURE_CLIENT_ID=$APP_ID"
echo "AZURE_TENANT_ID=$TENANT_ID"
echo "AZURE_SUBSCRIPTION_ID=$SUBSCRIPTION_ID"
```

Add the three printed values as GitHub repository secrets with the same names (Settings → Secrets and variables → Actions). They're identifiers, not passwords.

## Deploying locally

```bash
az deployment sub create \
  --name portfolio-infra \
  --location westeurope \
  --template-file infra/main.bicep \
  --parameters infra/main.bicepparam
```

Use the same deployment name as the workflow. The app job reads the Static Web App's name from that deployment's outputs.

## Custom domain

1. Deploy once and note the `defaultHostname` output.
2. Create a CNAME record from your domain to that hostname.
3. Set `customDomain` in `main.bicepparam` and deploy again.
