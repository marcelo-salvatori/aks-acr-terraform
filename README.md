# aks-acr-terraform
Deploys Azure Kubernetes Service and Azure Container Instance using Terraform.

## Prerequisites

1. An Azure Account (it can be [Free Trial](https://azure.microsoft.com/en-us/free/))
2. [Install Azure CLI](https://docs.microsoft.com/pt-pt/cli/azure/install-azure-cli-apt?view=azure-cli-latest)
3. [Install Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
4. [Create a Service Principal Account for Terraform](https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html)
5. Add the service principal's id and secret to the end of `~/.profile`:
```
export TF_VAR_client_id=""
export TF_VAR_client_secret=""
```

## Hands-On

In order to use these templates you must first clone this repository into your local machine and then initializing the folder to store Terraform's state file. This can be done locally or to a Storage Account (recommended).

To initialize and store .tfstate locally run:

`terraform init`

To initialize and store the .tfstate file in a Storage Account, first create the storage account and a container in Azure. Then run the command below:

```
terraform init \ 
-backend-config="storage_account_name=<yoursaname>" \
-backend-config="container_name=<yourcointainername>" \ 
-backend-config="access_key=<yoursaaccesskey>" \ 
-backend-config="key=codelab.microsoft.tfstate"
```
After initializing the folder, we can start deploying our infrastructure. 

First we must plan out deployment. This will let Terraform see the environment in its current state and compare to what we want it to be. This way we will be able to see what is going to be new, change or destroyed before applying the changes.

To do this we run:

`terraform plan -out out.plan`

After reading the output of our plan we can deploy it by running:

`terraform apply "out.plan"`

You can get the credentials of the AKS Cluster by running:

```
az aks get-credentials \
    --resource-group <aksresourcegroup> \
    --name <aksname> \
    --overwrite-existing
```

the command above stores the credentials in the `.kube` folder

Once we have both AKS and ACR deployed, we can attach them by running:

```
az aks update \
    --name <aksname> \
    --resource-group <aksresourcegroup> \
    --attach-acr <acrname>
```